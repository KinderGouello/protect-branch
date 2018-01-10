module Web::Controllers::Home
  class Index
    include Web::Action

    def call(params)
      body = JSON.parse(request.body.read)
      puts body
      client = Octokit::Client.new(:access_token => ENV['GITHUB_TOKEN'])
      client.protect_branch(
          body['repository']['full_name'],
          body['pull_request']['base']['ref'],
          {
              'enforce_admins' => true,
              'required_status_checks' => {},
              'required_pull_request_reviews' => {},
              'restrictions' => {}
          }
        )
    end
  end
end
