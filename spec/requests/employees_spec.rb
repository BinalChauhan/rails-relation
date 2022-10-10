require 'rails_helper'

RSpec.describe EmployeesController, type: :controller do
    def signin
        @account = FactoryBot.create(:account)
        sign_in @account
    end

    describe 'before actions' do
        describe 'find_employee' do
            it 'is expected to define before action' do
                is_expected.to use_before_action(:find_employee)
            end
        end
    end

    # craete action
    describe 'POST #create' do
        before do
            signin
            post :create, params: params
        end

        context 'when params are correct' do
            let(:params) { { employee: { firstname: "Abhishek", lastname: "kanojia", position: "hh",  company_id: 1} } }

            it 'is expected to create new user successfully' do
                p assigns[:employee]
                expect(assigns[:employee]).to be_a_new(Employee)
            end

            it 'is expected to have name assigned to it' do
                expect(params[:employee][:firstname]) == ("Abhishek")
            end

            it 'is expected to redirect to employees path' do
                # expect(response).to be_successful
            end
        end
    end

    #show action
    describe '#show' do
        it 'should return the user with given id' do
            get :show, params: { id: 6 }
            expect(assigns(:employee)) == (:params)
        end
    end

    # update action
    describe 'PATCH #update' do
        before do
            signin
            patch :update, params: params
        end

        context 'when user exist in database' do
            let(:employee) { FactoryBot.create :employee }
            let(:params) { { id: employee.id, employee: { firstname: 'test name' } } }

            context 'when data is provided is valid' do
                it 'is expected to update employee' do
                    expect(employee.reload.firstname).to eq('test name')
                end

                it 'is_expected to redirect_to employee_path' do
                    is_expected.to redirect_to(employee_path)
                end
            end
        end
    end
end
