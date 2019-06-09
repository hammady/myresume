class ApplicationController < ActionController::Base
  protect_from_forgery

  def prepare_variables
    # PREPARE variables here and use in app/views/home/print.pdf.erb
    # add supporting files
    LatexToPdf.config[:supporting] = %w(res.cls helvetica.sty url.sty)
    @hash = {}
    Metadata.where(standard: true, enabled: true).each do |metadata|
        @hash[metadata.key] = metadata.value
    end
    opensources = Task.where(:enabled => 't').where("employer_id is null").where("opensource_type is not null").order("updated_at desc")
    @opensources1 = opensources.where("opensource_type = ?", "main")
    @opensources2 = opensources.where("opensource_type = ?", "contrib")
    @educations = Education.where(:enabled => 't')
    @employers = Employer.where(:enabled => 't').order("id DESC")
    @freelancetasks = Task.where("employer_id is null").where(:enabled => 't').order("updated_at desc").select{|t|t.opensource_type.blank?}
    @activities = Activity.where(:enabled => 't')
    @publications = Publication.where(:enabled => 't').order("year DESC")
    @skills = Skill.where(:enabled => 't')
    @personalinfo = Metadata.where(:enabled => 't', :standard => 'f')
    @last_updated_at = [Activity, Education, Employer, Metadata, Publication, Skill, Task]
      .map{|klass| klass.maximum(:updated_at)}
      .max
      .try(:to_date)
  end        

end
