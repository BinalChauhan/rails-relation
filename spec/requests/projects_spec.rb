require 'rails_helper'

RSpec.describe ProjectsController, type: :controller do
      def signin
          @account = FactoryBot.create(:account)
          sign_in @account
      end

      describe 'before actions' do
          describe 'find_project' do
              it 'is expected to define before action' do
                  is_expected.to use_before_action(:find_project)
              end
          end
      end

      describe '#show' do
          it 'should return the user with given id' do
              get :show, params: { id: 1 }
              expect(assigns(:project)) == (:params)
          end
      end
end
