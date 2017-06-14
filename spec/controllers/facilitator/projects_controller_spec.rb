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

    describe '#index' do
      context 'facilitator access index page' do
        let!(:project1) { create(:project, :inactive, facilitator_id: facilitator.id) }
        let!(:project2) { create(:project, facilitator_id: facilitator.id) }
        let!(:project3) { create(:project, facilitator_id: facilitator.id) }

        before { get :index }

        it 'renders the index page' do
          is_expected.to render_template(:index)
        end

        it 'shows only active projects' do
          expect(assigns(:projects)).to contain_exactly(project2, project3)
        end

      end
    end

    describe '#show' do
      context 'facilitator access show page' do
        let(:project) { create(:project) }

        before { get :show, { id: project.id } }

        it 'renders the show page' do
          is_expected.to render_template(:show)
        end
      end
    end

    describe '#new' do
      before { get :new }
      it { is_expected.to render_template(:new) }
      it { expect(assigns(:project_creation_form)).to be_a(ProjectCreationForm) }
    end

    describe '#create' do
      let(:project_creation_form) { instance_double(ProjectCreationForm) }

      context 'when params are valid' do
        let(:params) { { project_attributes: attributes_for(:project) } }

        it 'redirects to root path and shows a success flash message on successful create' do
          stringify_hash_values(params[:project_attributes])
          allow(ProjectCreationForm).to receive(:new).with(facilitator, params) { project_creation_form }
          allow(project_creation_form).to receive(:save) { true }
          post :create, project_creation_form: params
          is_expected.to redirect_to(root_path)
          is_expected.to set_flash[:success]
        end
      end

      context 'when params are invalid' do
        let(:params) { { project_attributes: attributes_for(:project, :invalid) } }

        it 'renders new view on failed create' do
          stringify_hash_values(params[:project_attributes])
          allow(ProjectCreationForm).to receive(:new).with(facilitator, params) { project_creation_form }
          allow(project_creation_form).to receive(:save) { false }
          post :create, project_creation_form: params
          is_expected.to render_template(:new)
        end
      end
    end

    describe '#edit' do
      context 'facilitator access edit page' do
        let(:project) { create(:project) }

        before { get :edit, { id: project.id } }

        it 'sets the project modification form with the selected project' do
          expect(assigns(:project_modification_form).project).to eq(project)
        end

        it 'renders the edit page' do
          is_expected.to render_template(:edit)
        end
      end
    end

    describe '#update' do
      let(:project_modification_form) { instance_double(ProjectModificationForm) }

      context 'facilitator updates project' do
        let(:project) { create(:project) }
        let(:student_attributes) { { students_attributes: attributes_for(:student) } }
        let(:project_attributes) { attributes_for(:project).merge(student_attributes) }

        it 'redirects to root path and shows a success flash message' do
          params = { project_attributes: {
              name: "Renamed Project 1",
              location: "Location X",
              start_on: "2017-06-21",
              end_on: "2017-10-18",
              status: "1",
              students_attributes: {
                  name: "Student1",
                  birthday: "2016-11-06",
                  class_name: "1A",
                  comments: nil
              }}}

          allow(ProjectModificationForm).to receive(:new).with(project, params) { project_modification_form }
          allow(project_modification_form).to receive(:save) { true }
          post :update, id: project.id,  project_modification_form: params

          is_expected.to redirect_to(root_path)
          is_expected.to set_flash[:success]
        end

        it 'renders edit page on ununsuccessful update, shows error message, and has object' do
          params = { project_attributes: {
              name: "Renamed Project 1",
              location: "Location X",
              start_on: "2017-06-21",
              end_on: "2017-10-18",
              status: "1",
              students_attributes: {
                  name: "Student1",
                  birthday: "2016-11-06",
                  class_name: "1A",
                  comments: nil
              }}}

          allow(ProjectModificationForm).to receive(:new).with(project, params) { project_modification_form }
          allow(project_modification_form).to receive(:save) { false }
          post :update, id: project.id,  project_modification_form: params

          is_expected.to render_template(:edit)
          expect(assigns(:project_modification_form)).to eq(project_modification_form)
        end

      end
    end

  end

end

def stringify_hash_values(hash)
  hash.keys.each {|k| hash[k] = hash[k].to_s}
end