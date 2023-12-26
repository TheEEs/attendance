ActiveSupport::Reloader.to_prepare do
  MonkeyPatches::Administrate::Patches.perform
end
