require "rails_helper"

RSpec.describe CrudNotificationMailer, type: :mailer do
  describe "create_notification" do
    let(:mail) { CrudNotificationMailer.create_notification }

    it "renders the headers" do
      expect(mail.subject).to eq("Create notification")
      expect(mail.to).to eq(["to@example.org"])
      expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end

  describe "update_notification" do
    let(:mail) { CrudNotificationMailer.update_notification }

    it "renders the headers" do
      expect(mail.subject).to eq("Update notification")
      expect(mail.to).to eq(["to@example.org"])
      expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end

  describe "delete_notification" do
    let(:mail) { CrudNotificationMailer.delete_notification }

    it "renders the headers" do
      expect(mail.subject).to eq("Delete notification")
      expect(mail.to).to eq(["to@example.org"])
      expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end

end
