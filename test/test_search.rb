require 'minitest/autorun'
require './lib/search.rb'

class TestSearch < MiniTest::Test
  include WordSearch

  def setup
    grid = Grid.new(
      [
        %w[A B C D E],
        %w[F G H I J],
        %w[K L M N O],
        %w[P Q R S T],
        %w[U V W X Y]
      ]
    )
    @search = Search.new(%w[EJOTY PQRS], grid)
  end

  def test_can_check_coordinate_list_for_word
    assert(@search.word_matches_coordinate_list?(
      'EJOTY', [[4, 0], [4, 1], [4, 2], [4, 3], [4, 4]]
    ))
    assert(@search.word_matches_coordinate_list?(
      'PQRS', [[0, 3], [1, 3], [2, 3], [3, 3]]
    ))
    refute(@search.word_matches_coordinate_list?(
      'WORD', [[4, 0], [4, 1], [4, 2], [4, 3], [4, 4]]
    ))
  end

  def test_can_search_whole_grid_for_word
    assert_equal(
      [[4, 0], [4, 1], [4, 2], [4, 3], [4, 4]],
      @search.find_word('EJOTY')
    )
    assert_equal(
      [[0, 3], [1, 3], [2, 3], [3, 3]],
      @search.find_word('PQRS')
    )
    assert_nil(@search.find_word('WORD'))
  end

  def test_generates_report_of_all_word_locations
    assert_equal(
      "EJOTY: (4,0),(4,1),(4,2),(4,3),(4,4)\n" +
        "PQRS: (0,3),(1,3),(2,3),(3,3)\n",
      @search.word_locations_report
    )
  end

  def test_can_initialize_from_file_contents
    from_file = Search.from_file_contents(
      "EJOTY,PQRS\n" +
        "A,B,C,D,E\n" +
        "F,G,H,I,J\n" +
        "K,L,M,N,O\n" +
        "P,Q,R,S,T\n" +
        "U,V,W,X,Y\n"
    )
    assert_equal(@search.words, from_file.words)
    assert_equal(
      @search.word_locations_report,
      from_file.word_locations_report
    )
    from_file2 = Search.from_file_contents(
      "KGC,JNRV\n" +
        "U,V,W,X,Y\n" +
        "P,Q,R,S,T\n" +
        "K,L,M,N,O\n" +
        "F,G,H,I,J\n" +
        "A,B,C,D,E\n"
    )
    refute_equal(@search.words, from_file2.words)
    refute_equal(
      @search.word_locations_report,
      from_file2.word_locations_report
    )
  end
end
