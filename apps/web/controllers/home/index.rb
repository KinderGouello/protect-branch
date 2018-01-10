module Web::Controllers::Home
  class Index
    include Web::Action

    def call(params)
      body = JSON.parse(request.body.read)
      # puts body
      client = Octokit::Client.new(:access_token => ENV['GITHUB_TOKEN'])
      puts client.protect_branch(
        body['repository']['full_name'],
        body['pull_request']['base']['ref'],
        {
            :enforce_admins => true,
            :required_status_checks => {
              :strict => true,
              :contexts => [
                'continuous-integration/travis-ci',
              ],
            },
            :required_pull_request_reviews => {}
        }
      )
    end
  end
end
