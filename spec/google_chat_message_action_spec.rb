describe Fastlane::Actions::GoogleChatMessageAction do
  describe '#run' do
    it 'prints a message' do
      expect(Fastlane::UI).to receive(:message).with("The google_chat_message plugin is working!")

      Fastlane::Actions::GoogleChatMessageAction.run(nil)
    end
  end
end
