
# API Key: 48ZLKH7Sgbsb54jm
# API Secret: L1z3prtAUprPToT5KiPhw3BAlxOwfmSY
$coinbase = Coinbase::Client.new(ENV['COINBASE_API_KEY'] || "48ZLKH7Sgbsb54jm", ENV['COINBASE_API_SECRET'] || "L1z3prtAUprPToT5KiPhw3BAlxOwfmSY")

# user_credentials = {
#     :access_token => 'access_token',
#     :refresh_token => 'refresh_token',
#     :expires_at => Time.now + 1.day
# }

# $coinbase = Coinbase::OAuthClient.new(ENV['COINBASE_CLIENT_ID'] || "be3356e2c86b67bff37d783ec366dc2b0ae3e145b47590504568a740d3ea6f48", ENV['COINBASE_CLIENT_SECRET'] || "a626fc159bf2ec5d7ec02ec9a0cf2598f2c42f4d13e8b683f293fc972b787cf2", user_credentials)