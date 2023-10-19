class HelloJob < ApplicationJob
  # include Sidekiq::Job
  queue_as :default
  def perform(email)
    # Panggil fungsi pengiriman email di sini
    UserMailer.welcome_email(email).deliver_now
  end

end
