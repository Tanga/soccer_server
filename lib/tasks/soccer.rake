task :stats => "soccer:stats"

namespace :soccer do
  task :stats do
    require 'rails/code_statistics'
    ::STATS_DIRECTORIES << ["Domain", "app/domain"]
    ::STATS_DIRECTORIES << ["AR Repository", "app/domain_adapters/ar_repo"]
  end
end
