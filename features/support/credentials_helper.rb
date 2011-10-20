module CredentialsHelper
  def create_valid_api_key(name)
    write_file("credentials", ":#{name}: valid_key_for_#{name}")
  end

  def delete_gem_credentials
    remove_file("credentials") if File.exists?("credentials")
  end
end

World(CredentialsHelper)
