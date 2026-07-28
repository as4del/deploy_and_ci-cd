#include <userver/server/handlers/http_handler_base.hpp>
#include "jacob.hpp"
#include <vector>
#include <string>

class Jacob final : public userver::server::handlers::HttpHandlerBase {
public:
    static constexpr std::string_view kName = "jacob";
    using HttpHandlerBase::HttpHandlerBase;

    std::string HandleRequestThrow(const userver::server::http::HttpRequest &request, userver::server::request::RequestContext &context) const override {
        std::string n_str = request.GetPathArg("n");
        int n = std::stoi(n_str);

        std::vector<long long> dp(n, 0);
        dp[0] = 2;
        dp[1] = 1;
        for (int i = 2; i < n; ++i) {
            dp[i] = dp[i - 1] + 2 * dp[i - 2];
        }

        return std::to_string(dp[n - 1]);
    }
};

void jacob::add::AppendJacob(userver::components::ComponentList &component_list_) {
    component_list_.Append<Jacob>();
}
