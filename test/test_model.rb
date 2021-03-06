require 'helper'

class TestModelObject < AV::Model
end

class TestModel < AVTestCase

  def test_new
    VCR.use_cassette('test_new_model', :record => :new_episodes) do
      tmo = TestModelObject.new
      assert_equal tmo.new?, true
      tmo.save
      assert_equal tmo.new?, false
    end
  end

  def test_superclass
    tmo = TestModelObject
    assert_equal tmo.superclass, AV::Model
    assert_equal tmo.superclass.superclass, AV::Object
  end
end
