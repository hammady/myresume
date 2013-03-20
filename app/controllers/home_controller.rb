class HomeController < ApplicationController
  def index
    @skills_query = Skill.joins(:tasks).select("skills.name").group("skills.name").count
    @skills = @skills_query.map do |q|
      {:text => q[0], :weight => q[1]}
    end
    @skills_wordle = @skills_query.map do |q|
      { q[0] => q[1]}
    end
  end
  
  def print
    # PREPARE variables here and use in app/views/home/print.pdf.erb
    @hash = {}
    Metadata.find_all_by_standard(:t).each do |metadata|
      @hash[metadata.key] = metadata.value
    end
    @educations = Education.find_all_by_enabled(:t)
    @employers = Employer.where(:enabled => 't').order("id DESC")
    @freelancetasks = Task.where("employer_id is null").order("updated_at desc")
    @activities = Activity.find_all_by_enabled(:t)
    @publications = Publication.where(:enabled => :t).order("year DESC")
    @skills = Skill.find_all_by_enabled(:t)
    @personalinfo = Metadata.where(:enabled => :t, :standard => :f)
    render formats: [:pdf]
  end
  
  def print_as_string
    @pdf = render_to_string(action: 'print', formats: [:pdf])
    self.content_type = 'text/html'

    File.open(file="#{Rails.root}/tmp/a.pdf",'w:binary') do |io|
      io.write(@pdf)
    end

    render text: "wrote #{file}"
  end
end
