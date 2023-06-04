class AsyncLogJob < ApplicationJob
  queue_as :async_log

  def perform(message: "hello")
    AsyncLog.create!(message: message)
  end
end
