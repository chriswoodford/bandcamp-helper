require 'spec_helper'

describe "Authentication" do

  subject { page }

  describe "login page" do
    before { visit login_path }

    it { should have_selector('form', class: 'form-signin') }
    it { should have_selector('input', type: 'text') }
    it { should have_selector('input', type: 'password') }
    it { should have_selector('input', type: 'submit') }

  end
  
end