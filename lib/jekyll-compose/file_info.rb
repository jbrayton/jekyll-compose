class Jekyll::Compose::FileInfo
  attr_reader :params
  def initialize(params)
    @params = params
  end

  def file_name
    name = params.title.downcase.gsub(/ +/, '-').gsub(/[^A-Za-z0-9\-]/, '')
    "#{name}.#{params.type}"
  end

  def content
    front_matter = YAML.dump({
      'layout' => params.layout,
      'title' => params.title,
      'articledescription' => ''
    })

    front_matter + "---\n"
  end
end
