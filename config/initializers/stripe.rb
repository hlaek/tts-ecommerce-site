Rails.configuration.stripe = {

:publishable_key => "#{ENV['stripe_test_pk']}",
:secret_key => "#{ENV['stripe_test_sk']}"

}

Stripe.api_key = Rails.configuration.stripe[:secret_key]