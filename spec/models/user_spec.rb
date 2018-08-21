require "rails_helper"

RSpec.describe User, type: :model do
  let(:user) {FactoryBot.build :user}
  let!(:user1) {FactoryBot.create :user}
  let!(:user2) {FactoryBot.create :user}
  let!(:user3) {FactoryBot.create :user}
  subject {user}

  context "associations" do
    it "check a association with borrow" do
      is_expected.to have_many :borrows
    end
  end

  context "validates" do
    it "check the presence of name" do
      is_expected.to validate_presence_of(:name)
        .with_message(I18n.t "activerecord.errors.models.user.attributes.name.blank")
    end

    it "check max length of name" do
      is_expected.to validate_length_of(:name)
        .with_message(I18n.t "activerecord.errors.models.user.attributes.name.too_long")
    end

    it "check the presence of email" do
      is_expected.to validate_presence_of(:email)
      .with_message(I18n.t "activerecord.errors.models.user.attributes.email.blank")
    end

    it "check max length of email" do
      is_expected.to validate_length_of(:email)
        .with_message(I18n.t "activerecord.errors.models.user.attributes.email.too_long")
    end

    it "check the uniqueness of email" do
      is_expected.to validate_uniqueness_of(:email).case_insensitive
        .with_message(I18n.t "activerecord.errors.models.user.attributes.email.taken")
    end

    it "check the format of email" do
      is_expected.to allow_value("example@gmail.com").for(:email)
        .with_message(I18n.t "activerecord.errors.models.user.attributes.email.confirmation")
    end

    it "check min length of password" do
      is_expected.to validate_length_of(:password)
        .with_message(I18n.t "activerecord.errors.models.user.attributes.password.too_short")
    end

    it "check role of user" do
      should define_enum_for(:role)
        .with(%i[user admin superadmin])
    end
  end

  context "scope ordered_by_created_at" do
    it "applies scope to collections by created date ascending" do
      expect(User.ordered_by_created_at).to eq([user1, user2, user3])
    end
  end
end
