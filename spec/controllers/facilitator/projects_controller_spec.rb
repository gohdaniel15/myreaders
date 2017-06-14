require 'rails_helper'

RSpec.describe Facilitator::ProjectsController, type: :controller do

  context 'when not signed in as facilitator' do

    it { expect(get(:index)).to redirect_to(new_facilitator_session_path) }
    it { expect(get(:show, id: 1)).to redirect_to(new_facilitator_session_path) }
    it { expect(get(:new)).to redirect_to(new_facilitator_session_path) }
    it { expect(post(:create)).to redirect_to(new_facilitator_session_path) }
    it { expect(get(:edit, id: 1)).to redirect_to(new_facilitator_session_path) }
    it { expect(put(:update, id: 1)).to redirect_to(new_facilitator_session_path) }
    it { expect(patch(:update, id: 1)).to redirect_to(new_facilitator_session_path) }

  end

  context 'when signed in as a facilitator' do

    let(:facilitator) { create(:facilitator) }

    before { sign_in(facilitator) }

    describe 'GET #new' do

      before { get :new }

      it { is_expected.to render_template(:new) }
      it { expect(assigns(:project_creation_form)).to be_a(ProjectCreationForm) }

    end

    describe 'POST #create' do

      let(:project_creation_form) { instance_double(ProjectCreationForm) }

      before { post :create, project_creation_form: params }

      context 'when params are valid' do

        let(:params) { { project_attributes: attributes_for(:project) } }
        let(:project_attributes) { attributes_for(:project).merge(student_attributes) }
        let(:student_attributes) { { student_attributes: attributes_for(:student) } }

        it do
          allow(ProjectCreationForm).to receive(:new).with(facilitator, params) { project_creation_form }
          allow(project_creation_form).to receive(:save) { true }
          is_expected.to redirect_to(root_path)
          is_expected.to set_flash[:success]
        end

      end

      context 'when params are invalid' do

        let(:params) { { project_attributes: attributes_for(:project, :invalid) } }

        it { is_expected.to render_template(:new) }

      end


    end

  end

end
