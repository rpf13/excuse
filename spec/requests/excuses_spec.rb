require "rails_helper"

RSpec.describe "Excuses", type: :request do
  describe "GET /" do
    it "renders the landing page" do
      get root_path

      expect(response).to have_http_status(:ok)
      expect(response.body).to include("Generate a believable message for your team colleagues.")
      expect(response.body).to include("Press the button to generate a polished excuse")
    end
  end

  describe "POST /generate" do
    it "stores a newly generated excuse and redirects back to the landing page" do
      generated_excuse = "Hi team colleagues, I am recovering from a nasty cold and need to work from home today so I do not bring it into the office while I get through my tasks."
      allow(ExcuseGenerator).to receive(:generate).and_return(generated_excuse)

      post generate_path

      expect(response).to have_http_status(:see_other)
      expect(response).to redirect_to(root_path)

      follow_redirect!

      expect(response.body).to include(generated_excuse)
    end

    it "shows the current catalog size in the UI" do
      post generate_path

      follow_redirect!

      expect(response.body).to include(ExcuseGenerator.count.to_s)
    end
  end
end
