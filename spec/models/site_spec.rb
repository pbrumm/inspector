require 'spec_helper'

describe Site do

  before(:each) do
    @attr = {
      :name => "Donelson",
      :email => "user@example.com"
    }
  end

  it "should create a new instance given a valid attribute" do
    Site.create!(@attr)
  end

  it "should require a name" do
    no_email_site = Site.new(@attr.merge(:name => ""))
    no_email_site.should_not be_valid
  end


  it "should reject duplicate names" do
    Site.create!(@attr)
    site_with_duplicate_name = Site.new(@attr)
    site_with_duplicate_name.should_not be_valid
  end


end
