ActiveAdmin.register_page "Dashboard" do
    menu priority: 1
    content do
        para "Publish all changes from the button above to AWS S3 so that it is accessible from static websites as a pre-rendered PDF"
    end

    page_action :publish, method: :post do
        begin
            s3 = Aws::S3::Client.new
            prepare_variables
            pdf = render_to_string(template: 'home/print', formats: [:pdf], layout: 'application')
            s3.put_object({body: pdf, bucket: ENV['AWS_S3_BUCKET'], key: ENV['AWS_S3_OBJECT_KEY']})
            redirect_to admin_dashboard_path, notice: "Published PDF successfully to s3://#{ENV['AWS_S3_BUCKET']}/#{ENV['AWS_S3_OBJECT_KEY']}"
        rescue => e
            redirect_to admin_dashboard_path, alert: "Error publishing PDF [#{e.message}]"
        end
    end
      
    action_item :preview do
        link_to "Preview PDF", home_print_path
    end

    action_item :publish do
        link_to "Publish PDF to AWS S3", admin_dashboard_publish_path, method: :post
    end
end
