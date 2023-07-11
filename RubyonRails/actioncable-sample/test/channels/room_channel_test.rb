require "test_helper"

class RoomChannelTest < ActionCable::Channel::TestCase
  test "subscribes" do
    subscribe
    assert subscription.confirmed?
    assert_has_stream "room_channel"
  end
  
  test "broadcast" do
    subscribe
    text = "hello"
    broadcast_text = ApplicationController.render(
      partial: 'messages/message',
      locals: {message: Message.new(contet: text) }
    )
    assert_broadcast_on('room_channel', message: broadcast_text) do
      perform :speak, message: text
    end
  end
end
