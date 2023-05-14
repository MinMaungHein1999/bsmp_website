class BkjobsController < InheritedResources::Base

  private

    def bkjob_params
      params.require(:bkjob).permit()
    end

end
