require 'spec_helper'

describe CouchPotato::View::ViewQuery, 'query_view!' do
  before(:each) do
    CouchRest.stub(:get => nil)
  end
  
  it "should not pass a key if conditions are empty" do
    db = mock 'db', :get => nil, :save_doc => nil
    db.should_receive(:view).with(anything, {})
    CouchPotato::View::ViewQuery.new(db, '', {:view0 => {}}).query_view!
  end
  
  it "should not update a view when the map/reduce functions haven't changed" do
    db = mock 'db', :get => {'views' => {'view' => {'map' => '<map_code>', 'reduce' => '<reduce_code>'}}}, :view => nil
    db.should_not_receive(:save_doc)
    CouchPotato::View::ViewQuery.new(db, 'design', :view => {:map => '<map_code>', :reduce => '<reduce_code>'}).query_view!
  end
  
  it "should not update a view when the list function hasn't changed" do
    db = mock 'db', :get => {'views' => {'view' => {'map' => '<map_code>', 'reduce' => '<reduce_code>'}}, 'lists' => {'list0' => '<list_code>'}}, :view => nil
    db.should_not_receive(:save_doc)
    CouchPotato::View::ViewQuery.new(db, 'design', {:view => {:map => '<map_code>', :reduce => '<reduce_code>'}}, :list0 => '<list_code>').query_view!
  end
  
  it "should update a view when the map function has changed" do
    db = mock 'db', :get => {'views' => {'view2' => {'map' => '<map_code>', 'reduce' => '<reduce_code>'}}}, :view => nil
    db.should_receive(:save_doc)
    CouchPotato::View::ViewQuery.new(db, 'design', :view2 => {:map => '<new map_code>', :recude => '<reduce_code>'}).query_view!
  end
  
  it "should update a view when the reduce function has changed" do
    db = mock 'db', :get => {'views' => {'view3' => {'map' => '<map_code>', 'reduce' => '<reduce_code>'}}}, :view => nil
    db.should_receive(:save_doc)
    CouchPotato::View::ViewQuery.new(db, 'design', :view3 => {:map => '<map_code>', :reduce => '<new reduce_code>'}).query_view!
  end
  
  it "should update a view when the list function has changed" do
    db = mock 'db', :get => {
      'views' => {'view4' => {'map' => '<map_code>', 'reduce' => '<reduce_code>'}},
      'lists' => {'list1' => '<list_code>'}
      }, :view => nil
    db.should_receive(:save_doc)
    CouchPotato::View::ViewQuery.new(db, 'design', {:view4 => {:map => '<map_code>', :reduce => '<reduce_code>'}}, :list1 => '<new_list_code>').query_view!
  end
  
  it "should update a view when there wasn't a list function but now there is one" do
    db = mock 'db', :get => {
      'views' => {'view5' => {'map' => '<map_code>', 'reduce' => '<reduce_code>'}}
      }, :view => nil
    db.should_receive(:save_doc)
    CouchPotato::View::ViewQuery.new(db, 'design', {:view5 => {:map => '<map_code>', :reduce => '<reduce_code>'}}, :list1 => '<new_list_code>').query_view!
  end
  
  it "should not update a view when there is a list function but no list function is passed" do
    db = mock 'db', :get => {
      'views' => {'view6' => {'map' => '<map_code>', 'reduce' => '<reduce_code>'}},
      'lists' => {'list1' => '<list_code>'}
      }, :view => nil
    db.should_not_receive(:save_doc)
    CouchPotato::View::ViewQuery.new(db, 'design', {:view6 => {:map => '<map_code>', :reduce => '<reduce_code>'}}, {}).query_view!
  end
  
  it "should not update a view when there were no lists before and no list function is passed" do
    db = mock 'db', :get => {
      'views' => {'view6' => {'map' => '<map_code>', 'reduce' => '<reduce_code>'}}
      }, :view => nil
    db.should_not_receive(:save_doc)
    CouchPotato::View::ViewQuery.new(db, 'design', {:view6 => {:map => '<map_code>', :reduce => '<reduce_code>'}}, {}).query_view!
  end
  
  it "should query CouchRest directly when querying a list" do
    db = stub('db').as_null_object
    CouchRest.should_receive(:get).with('http://127.0.0.1:5984/couch_potato_test/_design/my_design/_list/list1/view7?key=1')
    CouchPotato::View::ViewQuery.new(db, 'my_design', {:view7 => {:map => '<map_code>', :reduce => '<reduce_code>'}}, :list1 => '<new_list_code>').query_view!(:key => 1)
  end
  
end