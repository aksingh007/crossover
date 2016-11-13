require 'rails_helper'

RSpec.describe Ticket, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"

  describe "Importing data" do
    let(:person) { Person.new }

    let(:data) { "title\tsurname\tfirstname\t\rtitle2\tsurname2\tfirstname2\t\r"}
    let(:result) {[["title","surname","firstname"],["title2","surname2","firstname2"]] }

    it "should read in the csv" do
      CSV.should_receive(:read).
        with("filename", :row_sep => "\r", :col_sep => "\t")
      person.import("filename")
    end

    it "should have result" do
      filename = mock(File, :exists? => true, :read => data)
      person.import(filename).should eq(result)
    end
  end
end