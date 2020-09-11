require 'rails_helper'

RSpec.describe UsersController, type: :controller do
    describe "GET #index" do
        it "renders users index template" do
            get :index
            expect(response).to render_template(:index)
        end
    end
    
    describe "GET #show" do
        let!(:user123) do
            User.create(username: "user123", password: "password", email: "user123@aa.io")
        end
        
        it "renders users show template" do
            get :show, params: {id: user123.id} #create a user first so we know we have id:1
            expect(response).to render_template(:show)
        end
    end
    
    describe "GET #new" do
        it "renders users new template" do
            get :new
            expect(response).to render_template(:new)
        end
    end
    
    describe "POST #create" do
        context "with valid params" do
            it "should redirects_to to users show page" do
                post :create, params: {user: {
                    username: "Harry Potter",
                    email: "harrypotter@aa.io",
                    password: "password"
                }}

                user = User.find_by(username: "Harry Potter")

                expect(response).to redirect_to(user_url(user))
            end
        end
        
        context "with invalid params" do
            it "renders users new template" do
                post :create, params: {user: {
                    username: "Harry Potter",
                    email: "harrypotter@aa.io",
                    password: ""
                }}

                expect(response).to render_template(:new)
            end
        end
    end
    
    describe "GET #edit" do
        let!(:user123) do
            User.create(username: "user123", password: "password", email: "user123@aa.io")
        end

        it "renders users edit template" do
            get :edit, params: {id: user123.id}
            expect(response).to render_template(:edit)
        end
    end
    
    describe "PATCH #update" do
        let!(:user123) do
            User.create(username: "user123", password: "password", email: "user123@aa.io")
        end
        
        context "with valid params" do

            it "should redirects_to to users show page" do
                patch :update, params: {user: {
                    username: "Harry Potter",
                    email: "harrypotter@aa.io",
                    password: "password"
                }, id: user123.id }

                user = User.find_by(username: "Harry Potter")

                expect(response).to redirect_to(user_url(user))              
            end

            it "should update user's information" do
                user123.update(email: "bad_user123@aa.io")
    
                expect(user123.email).to eq("bad_user123@aa.io")
            end
        end

        context "with invalid params" do
            it "renders users edit template" do
                patch :update, params: {user: {
                    username: "Harry Potter",
                    email: "harrypotter@aa.io",
                    password: ""
                }, id: user123.id}

                expect(response).to render_template(:edit)
            end
        end
    end
    
    describe "DELETE #destroy" do
        let(:user123) do
            User.create(username: "user123", password: "password", email: "user123@aa.io")
        end

        it "deletes instance of user" do

            user123.destroy
            expect(User.find_by(username: "user123")).to be_nil
        end

        it "redirects_to users index page" do 
            delete :destroy, params: {id: user123.id}
            expect(response).to redirect_to(users_url)
        end
    end
end