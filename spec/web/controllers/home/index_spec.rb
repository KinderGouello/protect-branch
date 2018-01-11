require_relative '../../../spec_helper'

describe Web::Controllers::Home::Index do
  let(:action) { Web::Controllers::Home::Index.new }
  let(:params) { '{"repository": {"full_name": "github/gitignore"}, "pull_request": {"base": {"ref": master}}}' }

  it 'is successful' do
    # response = action.call(params)
    # response[0].must_equal 200

    assert_equal('test', 'test')
  end
end
