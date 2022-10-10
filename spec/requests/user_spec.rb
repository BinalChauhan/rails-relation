require 'rails_helper'

RSpec.describe UsersController, type: :controller do

    describe 'before actions' do
        describe 'find_user' do
            it 'is expected to define before action' do
                is_expected.to use_before_action(:find_user)
            end
        end
    end
    # index action
    describe 'GET #index' do
        before do
            get :index
        end

        it 'is expected to assign user instance variable' do
            expect(assigns[:users]) == (User.all)
        end
    end
    # new action
    describe 'GET #new' do
        before do
            get :new
        end

        it 'is expected to assign user as new instance variable' do
            expect(assigns[:user]).not_to be_a_new(User)
        end
    end
end
