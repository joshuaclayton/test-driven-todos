require "rails_helper"

describe Todo, "validations" do
  it { is_expected.to validate_presence_of(:title) }
end
