//
//  RegistCoinView.swift
//  Caffeine
//
//  Created by 김상진 on 2023/05/30.
//

import SwiftUI

struct RegistCoinView: View {
    let crypto: Crypto
    @State var amount: String = ""
    @State var avgPrice: String = ""
    
    var body: some View {
        VStack {
            Text("자산 추가")
            VStack {
                CoinDataInputView(crypto: crypto,
                                  amount: $amount,
                                  avgPrice: $avgPrice)
            }
            .padding(EdgeInsets(top: 20, leading: 20, bottom: 20, trailing: 20))
            .background(.gray)
            .cornerRadius(20)
            .padding()
            .frame(height: 500)
        }
        .onAppear {
            avgPrice = crypto.currentPrice.krwFormat()
        }
    }
    

}

struct RegistCoinView_Previews: PreviewProvider {
    static var previews: some View {
        RegistCoinView(crypto: Crypto(id: "", name: "비트코인", image: "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAMgAAADICAMAAACahl6sAAAAdVBMVEX3kxr////3kRf3lBz//vz7xIH3liD+9+33mCT/+fL/+/f4myz93rn4njH/+vT4oDb82a795sr94b/+8+X5rlT7zJL4ozz6uWv81qj+7dr7zpj5p0X96dD6vHD6tmX+69X6wXv7yIr5sFf81qn80Z75p0T5r1Vrrt4zAAAM6UlEQVR4nO2d65aqOBCFlYug3MEbqAi29vs/4oAXCFCEVCVqr1ln/5uzppXPZCepSiXM5v8Tzb79AKr0D+Sv6R/IX9M/kL+mD4AYld7/LW8CMXwrOUfu/ropS7MozLLcXPdudE4s/01Q6kFW1jHMivwQOLat67NGum7bTnDIiyw8WivlX6sUxFimYZnfnMWMq4Vzy8swXSptG3UgqzQ0f70JBobG+zXDVF3LKALxj1keCEM0MEGeHX01T6ACZHXOLo4+/dyQdOeSnVW0izSIkYS5R6R4snh5mEj7RRJkdSxv6B411OJWHiWbRQrEj09yjdFK906xlFskQHw3d9RQPOTkrgQKGaTCsFVi1LIlUIggq0g9xgMlInqFBnIulHYqVk5x/hiIlW3fhVFrm1kfATHiXwUDLk+L3xg/raBBEvNtvaqVYyZvBjHitaKJgy99jW0UHIhVfqA5HnJKnFNQIOf8I83xkJ6jhi8EiBG+dbAaahsiupc4yPJz3eolp1yqB0lObx50IS1OwqOXKMj58nmMWhdRowiCRIfvcMxmh0gliBt8i2M2C1xlIEb4RY6KRGjwEgAx9h8frrpy9gIk0yBf5xAjmQT5AxxCJJMgofdtilpeKAsiO17pjq1pmjzJ5Ng1ARLdJB/Ai90yDxTA3CbmEz5IKjsPautqteQndxjJlfMhpYNYuSTHTDOfH+Un4U2yUXJugMID8Qvp8GPRmjTZPkGo3UwveEkvDoiRya93vbY/xK9E2IHqmUXGGYQ5ILH8wHu3yFOb57/p19XDMzM0ixdTQKSNPmMsMp+v8udzO8f6P/0k3uTooZ1j+FGQ5UmeA7KIdmg8a5ToDzyNhoyjIAoMAlpEK5qObpzQnWuRYUEiFSt30CL75p+sA97xwdi8OAJiYSNbcBQat8jjx6IsRy8js8kISIacQfTD1h7C8C0yv1KmKX2kc8EgR2zHcqJ6FOrDKLdIreAIPjII4u+QH66t69951YOBZ5HmnygWqbUDJ3gQJMTuRrW/MwsDWqQ1K8kilWwwNoFAEvRUuPhh//4Jo+lvsEitA5S1A0CMDfobvEEarYY5ARY5yVqkkr4B1lwAyBmdq35YZCBmW1OhRSptgZXKEMQw0R/MDEWwKos8nlqBRWqZw+8bgpzxc3rXIhDIz27r1IHITYFFKgXDjPAAhNAggEWGKFaU7ba2CovUGjbJAITQIOx8wYeJ28lMwiIzqEn6IJQG0S5HfFnfUS7vN2iSPkhK2V5beOvi52yhYEJbKkM0GLj6IPg55C5Nu8Mg6sescBfodBR9wwexJOJbTdO3V0RJzCrN1gsyyqE3dfVAQrm4ULP3c4ysMLeJKIveiqsLspLNyGn9H2pKvnshtkrebfwuyFE6A+TA0QJH1nVLIvG639QF2Uz//RSI4N5l5+fbkRqla/cOiLWW5dACfqoZ1jJzCCTdlWoHJJYu79Muw/DN2kzWwRthgCexO3nHDghhVu+DlMOnjO3HhMldx7gEEpP9ABZEZhJ5qj8o1sruCfiF91vGnMmfQNLpWyxIJN+zAIusds12gn3gFFzv0d9uswMLCyI/ZmmXYf9JmNFVmzm7eARlhe/Y7LjFgPjydTOaOXi+fiSoOaeRqSZFb2mxIwsDksrvh4xYpCstuMJbT+gFK5MAZEEk11n9T36qsQhDYpsgydlDNgn7uzEgCgZfIFRMoAXIwoSM4ufYvsX05BZk+SsPMm2RFwm4St5gQX7bH64FSeV3RIQscpcGZgvRnZsZ7VsQV/74gZhF7gIzSOhUl90WdrQgCmYRUYvM4F5ISEi0M0kDYshvfopbpPp/d4Dd8SBtnqwBWUov4REW6WSzZUDaPtCAJPJeR1hkpvWzILzmG1fQjBkz+ocMng1hkV4w8RR+vGkD0gZEfl5HWQRYXY73w3G1vXlG/5DxD51+NHD7zCjwwVWzx9uAyC9QEBbRC2iJYq0losRZ85WyHJBFfBPaftcWJzD7RclrN6P4C2QpHYyAU1y7yfuiqROrGRy+Y6sUajVee4HIx+uQRV4wWfG7dexazja/pnDkTulZbQq4AZE+rQNYpJWxTM6xWylKRoN29O5+rW0fJJEND0W3rUZlXSjpRu81I75AJDeQRiyCELGCssk1KwMZtYigXErWFACRXqFwLSLAQcg03kFea5QXiGxYJWeR1Z7I0YZWykBkLJKY1H0r9SCQRXyxDcVkLzGHKQeBFlrmLoumbgkyovJA3xFVDwJZxKpiEWdbwYzPgRVteJPabx+ASGbiR2MRrYY5XTkX66QF2SAzJiOvaB7hxiLVOtG7ZCMrrHrIwqZKGameEIH6oG75j6YH4ze4xPSjJQMQuVQ8VELXL//RNDt3R9wS0XaoZ8BaSy6JApXQAWsFzR7bG3GpvSvog1hSp8KgBChYITe6N3Il5j5u/WW8XC5+0iItiW2CYS5+S+Gh336EKFWFImKRRnoBrsqIq9a8H7MbBZ1D1CJPLaCy3fGcJF/NNzfpIJlkvLBF7tI8sF6FliFsMq8NyF6ietURtshd2gkahRPKSr49VtOAYOtQmAN44EKLU0SqbaHtKpLd2xRyA4KcEZ2iOU2oMXXijbjeBTPYc5MA0i66GxBcYkvbrV6nCSsmYEDl1lnb4FFoSva5LdhrQHA50+ej+ImbZdAdZfw6a7hFKC5t973aPUTMoUDtdyJC59dZwyXoFJCy+esWBDP8Qa7oiGuRkUQFAYSJHlqQs/jUqt2mbsLhH0WAtt1IxxeYcb8FwbgdOL/REdciGnBoolaJH7WY4twWBLE/7U3VxFq8QFyHT3NT1ijM1jBTVCPctOAeeUfL8hIsRs6s6yMHhy18mMhalQERjnbhaaAjY5m6IIxmQ7NOLcLyl62WZkBETSKcHa1h8q1T0zylO6PRLmXVytavszWNgvuhk2Mvq/qq702Rrw+VLsU1Gk0LSe2E9kAEk3SLk8tLuQEyVkurEvemdUKGsNPFWZBEcPtNs4N8EyNhJkQZszqLaBZEfACuLGxvT9cIdxqJJ5cQ6Xbqcjol5aggrbbuodiflVz/TtlA7GY3OyCifYuBWXhr002lr0ynbCB2w7MOCCkDUcEEeRlTrrZtFFHC3G7Go3sQhnjuorbM1PKLp+RXKsoFQCROwmAml55oV7D0cmm9U2+UcpC7mCNJFtIyvklJBPUvseiBUIt/2dNu++BSIqbMJYlj1j/g0QOhJhzZmwOKalFlb6spU8g1KfHq3X5ys3/ElZiCHdwcUMGIHElc7om7AIPTdX0QYgEa87mvaEDLJ3vX0s2pO7qDkGhwnp00Ancs8uoqbWS+is+DbWpjeczW9DqBQUJpAOJT9he6Fhl8Vxo4h515dY9pUq+CreQYZ8XakTg8nQ8GxuGdD5Qdd+ByDTbBG95jK912vKCOS7aeA1Q6YgTEqEMQSpNMWKTJ6r4iRQmGu4YNAt2LEqMHrgmLLCnFijw5QMoVuqmmQINMWET1dajQNSzQ3UHoS6kmLaKWA7yYCgJBXx4kahE1Aq8Ogq+lSnCLYMgizOlj1RZZg4ln+MYzXAmudmmWiK1F2gFSsUXg67VGQFa4CMG+vUrMGosEb7MIuJM6epleilvLac8SMytqLNKO9GotchupZh27p/EHPb/XMLfDuy1ij10cNQayKihf08zZb7MIePCEB0K4iI6VXTZlmUotAh4o5YPI3pJrb58DgEqLcO7JHQeRvbf4OQC4Ci3Cu7mYc3Gxgoty64SXwrfhnDjpGd6d2MgJ/u2Cp3QBkPnxwy/l4WvL3YLl3xvv/on3ETzk8Xcu+SAG/rKSd8meeE/ExCsJjOyPkNi8q9YFQOYrWkJTteDbLjAg1NSsao7JHfFJkL9AIsAhAPJ9EhEOEZBvkwhxCIHMl+UXxy5b7IVvQiDzVfa1Nw45mdiWkRjI3Pj50ju5gh/BTVZBkPrUzTc4bpwXdRBB5ufLB19P+ZAu/O49DMjcMj9s+ZGjJtIg9YnaT3IEe0z9EQZkPo8+1730C+5WVBzI595Hi30bLRbkQ28Ixr8fGA1SRfLl28NGr0S/sZkAMjfe9G72l+w8IlQaEUDqeoXD2/qXftiT7ioggVT9a/OmBMt2g+9VMiBzIzXfMKkE5ugZ63eBVChnM1DawfTAPNPL8OggNUp5U4ai30oJDDmQCiW5rpWMYPb6ingLgHqQSsu4kO1helDEkhcPKQCpfX/NPTKL7o3eU/VpkEr+8ZoHhAzFIsivZ+nq57vUgMzrVz6ExcFBNExdkB6myk4KKAOpZFjHfbH2prd2dNtbF/ujuiMCc7UgtYxlGmfF5ebZC4BHX9je7VJk8dSN+HipBrnL8K00Cq9lccofZ3kOh3Wen4ryGkYp/zwMWW8BeckwfP9+lseylr5vvAXgpbeCfFL/QP6a/oH8Nf0HwTnVe+MhmAIAAAAASUVORK5CYII=", currentPrice: 0))
    }
}
