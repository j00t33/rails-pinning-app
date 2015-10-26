require 'spec_helper'
RSpec.describe PinsController do
	describe "GET index" do
		it "renders the index template" do
			get :index
			expect(response).to render_template("index")
		end

		it "populates @pins with all pins" do
			get :index
			expect(assigns[:pins]).to eq(Pin.all)
		end
	end

	describe "GET new" do
		it "renders the new pin template" do
			get :new
			expect(response).to render_template("new")
		end
	end

	describe "GET edit" do
		it "renders the edit pin template" do
			get "#{:id}"
			expect(response).to render_template("edit")
		end

		# it "assigns @pin to the Pin with appropriate id" do
		# 	expect(assigns[:])
		# end
	end
end