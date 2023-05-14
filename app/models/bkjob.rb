class Bkjob < ApplicationRecord
 
    attr_accessor :job_class, :job_id, :queue_name, :arguments, :executions, :enqueued_at
    
    def initialize(job_class:, job_id:, queue_name:, executions:, enqueued_at:, arguments:)
        @job_class = job_class
        @queue_name = queue_name
        @executions = executions
        @enqueued_at = enqueued_at
        @arguments = arguments
    end
      
end
