Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '189968117715250', 'e3da40b8113f5b538e27048e9b12dc6c'
end