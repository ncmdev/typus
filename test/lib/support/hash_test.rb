require "test_helper"

class HashTest < ActiveSupport::TestCase

  should "verify Hash#compact" do
    hash = { "a" => "", "b" => nil, "c" => "hello" }
    hash_compacted = { "c" => "hello" }
    assert_equal hash_compacted, hash.compact
  end

  context "cleanup" do

    should "work" do
      whitelist = %w(controller action id attribute layout resource resource_id resource_action selected back_to )
      whitelist.each do |w|
        expected = { w => w }
        assert_equal expected, expected.dup.cleanup
      end
    end

    should "reject unwanted stuff" do
      hash = {"value"=>"1000", "CKEditor"=>"1", "CKEditorFuncNum"=>"1", "langCode"=>"en", "target"=>"_parent"}
      expected = {}
      assert_equal expected, hash.cleanup
    end

  end

end
