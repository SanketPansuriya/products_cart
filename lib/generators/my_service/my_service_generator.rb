class MyServiceGenerator < Rails::Generators::NamedBase
  source_root File.expand_path("templates", __dir__)
  argument :name

  def file_name
    puts "Service name: #{name}"
  end

  def create_service
    capital = if name.last == "/"
      ""
    elsif name.include? '/'
      name.split('/').map(&:capitalize).join("::")
    else
      name.capitalize
    end

    if capital.present?
      create_file "app/service/#{name}.rb","class #{capital}\n  #put your logic here\n\nend"
    else
      puts "-----------------------------------------------------"
      puts "--------Please give proper sevice file name----------" 
      puts "-----------------------------------------------------"
    end
  end

end
