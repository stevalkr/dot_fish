function 1p
  eval $(op signin)
  set -gx NOTIFY_API_KEY $(op read "op://Private/Notify My Device/ApiKey")
end
