module UserData
  class SponsorshipsController < BaseController
    before_action :load_sponsorships, only: :index

    private

    def load_sponsorships
      @sponsorships = current_user.sponsored_pets
    end
  end
end
