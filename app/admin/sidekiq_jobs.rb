ActiveAdmin.register_page "Sidekiq Jobs" do
  content do
    @job_arr = Array.new
    @args_arr = Array.new
    queue = Sidekiq::Queue.new("default")
  
    queue.each do |job|
      @job_arr << job
    end

    @job_arr.each do |job|
      job.args.each do |arg|
        book = nil
        subscriber = nil
        object = OpenStruct.new(arg)
        
        if(object.arguments.size>2)
         
          job_args = object.arguments[3]
          subscriber_id = job_args["args"][1]["_aj_globalid"].split("/").last.to_i
          book_id = job_args["args"][0]["_aj_globalid"].split("/").last.to_i

          book = Book.find(book_id)
          subscriber = Subscriber.find(subscriber_id)
        else
          book = Book.find(object.arguments[0])
          subscriber = Subscriber.find(object.arguments[1])
        end

        

        object.jid = job.jid
        object.book = book
        object.subscriber = subscriber
        @args_arr << object
      end
    end

    table_for @args_arr do
      column :jid
      column :job_id
      column :job_class
      column :queue_name
      column :book
      column :subscriber  
      column :executions
      column :enqueued_at
      
      column "Action" do |arg| 
        link_to "Stop", admin_sidekiq_jobs_stop_path(arg.jid), method: :put, data: { confirm: "Are you sure?" }, class: 'publish_button'
      end
    end

   
  
  end

  page_action :stop, method: :put do
    jid = params[:format]
    queue = Sidekiq::Queue.new("default")
    job = queue.find_job(jid)
    
    if job
      job.delete
        puts "Job #{jid} killed."
      else
        puts "Job #{jid} not found in queue."
    end

    redirect_to admin_sidekiq_jobs_path, notice: "Your event was added"
  end
  
end
