require "rails_helper"

RSpec.describe "Api::V1::Test", type: :request do
  describe "GET /api/v1/test" do
    it "returns http success" do
      get "/api/v1/test"
      expect(response).to have_http_status(:success)
      expect(response.body).to eq({message: "ok"}.to_json)
    end

    context "throttle IP request" do
      it "returns too many requests" do
        3.times { |x| get "/api/v1/test" }
        expect(response).to have_http_status(429)
        expect(response.body).to eq("Too many requests, please retry after 1 minute\n")
      end

      it "returns http success after throttled" do
        3.times { |x| get "/api/v1/test" }
        sleep(5)
        get "/api/v1/test"
        expect(response).to have_http_status(:success)
        expect(response.body).to eq({message: "ok"}.to_json)
      end
    end
  end
end
