<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Train Me 健身教練與學員的最佳媒合平台</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<style>
.input-group-addon {
	background-color: transparent;
	border-left: 0;
}

.cc-number.identified {
	background-repeat: no-repeat;
	background-position-y: 3px;
	background-position-x: 99%;
}

.one-card>div {
	height: 150px;
	background-position: center center;
	background-repeat: no-repeat;
}

.two-card>div {
	height: 80px;
	background-position: center center;
	background-repeat: no-repeat;
	background-size: contain;
	width: 48%;
}

.two-card div.amex-cvc-preview {
	float: right;
}

.amex-cvc-preview {
	background-image:
		url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAOYAAACOCAYAAAAlzXSMAAAAAXNSR0IArs4c6QAAI3ZJREFUeAHtXQecFDUXf7dX6b2IdBCpAoqACkgTFZDeiwgiKPIBUqQpFkAUEBABpSO9CUjvXapU6UiT3o5ytDuufPnnLsPM7Nxxx84ei/ve73c3meTlJflnXspLNvGhx9D4zUdSJE1KKR7DxsGMACMQTwTu3aOQD8vkD4mL3cccWH/2bN86+Yo3IYejoQgsR+TDSmkGid8ZAZcRiAqJItpIkZGz5h3bM31OgwYRepEGxZy292RJh4MmCc8CeiZ2MwKMgPsQEAp6ODKSPmhaLPcOlYqmmNP3/FPLx9cxQ3gEqUB+MgKMQOIgIJTzQVREZOMmxfMuQIpSMafsO/6yP/luFm9JEicbnAojwAg4IRBF9x9SRJnmRV/Y7RCBPv7kGMtK6QQTezACiYuA6BilLgqd9Jmx73gNHx/fPxI3B5waI8AIxIZAVFRETdFj+taLjYH9GQFG4Gkg4FvPERkRXvlpJM1pMgKMgDUC0EmHoAzWwezLCDACTwMB6KTDx+HwexqJc5qMACNgjQB0ElZZJkaAEfAwBFgxPaxCODuMABBgxeTvgBHwQARYMT2wUjhLjAArJn8DjIAHIsCK6YGVwlliBFgx+RtgBDwQAVZMD6wUzhIjwIrJ3wAj4IEIsGJ6YKVwlhgBVkz+BhgBD0SAFdMDK4WzxAiwYvI3wAh4IAKsmB5YKZwlRoAV0+ZvICoqii6f+5eCr1y2WTKLswOBSHFO5KV/T9PVC+cpMsJwlKul+ITyWwp5As9E+S3m2eNH6fP61WT2kqdMRSNXbaGAwECn7A745APav3Wz5t9t+Bh6uVxF7X3n2lU0pPMn2nvR18tRj1ET5Pvgjm1o14a1WpiVI3P2HDR04RoZNKRzO9q5dqUTW0BgECVLmZJyFShENVp9TC8We0Xj+apFAzq2bzdly5OPBv6+VPOH48LpkzRpwNd0dO9uCr1/T4YlSZ6CyteqRw0+/YySJEtu4Fcv/x47Qt0bVJevcWEzrGt72r56Ofn6+tF3MxZQ9nz5lQj57FS9omwQqjZrRc279jKE6V8Gd2wrcIrGQO+vd2fOJnBatIb+3vYnoU7Q2OQvXoL6TJghTonSTjyl7z5uIXkQt9evk6hI6TKifoy4gt/Xz4+CkiSlzNlz0rvNWtLr70SXF/FUueDWk6qHnPlFPbRsQ/lfflULHtrlU9qxZoX2buXIkOV5Gr50gxaEssweMYTOHDtMYQ8eSH+Hry+VqvwONezQlVBmPYF/zsihdProIQN/yUpvUyPwi7K4kxKlx1w7fzZFiZYKfyE3b9C2lcaPWhUwMiKaR/H+rVNS8BwQYKkwPCMjH7V4kZFRhjA9n3JDviK0lspf/4RSBV++RLvWr6G+HzalEwf3qygavz5dBG5Ztoh6COVCo6KUEv7374TQsqkTqbtolFBuK1pnwmb7KmtsoBzIZ/jDMBrX9wupLHp5yJMsR9SjMurDlTtKhOvLa+VWPUmR0m9Q2eq1JP/hXTto/YI5SgxtXbGE9m/ZJMPKVK0hlRKBZnmQ9TA0VJb/+P49NPzzDrR67gxNjiqXOZ6qh92iEenbuhkd37/3UZyYb8kcR/+uyoBIyDsaGKQPpURDAQIPyvFNy0Z0+0aw9MO/I7t30vftWspG2MyPb1fyB1/X+N3hcHuP+TAslDYunGfI+xpRMeXeq23ws3pBq6Wnv7c96k31/tItPlxQ8lSpqfeYKdJt/ucfEGD2oqQpUtCX46ZH+wsZD8WHv+GPubRm7kypBIsmjqFOg0fIcHxEZrp1/RqN/ba3rPDU6TNQy17fUMESpeSHOGfUMNq6fDFdOXeWZvw0kNp8NcAQXWKzaL7Bb/WcGUIZ4sYGvTYUumKdhoa48XlRRUgmRi5fjJ1qGUWPU/NuX9DezRsI5Zz64wB65c1K5C9GO5MH9pVxU6RJS+9//qUmR2GkcEVDgI97z8Z1tHjyOIoID6dZP/9IFWs3IPRYioKSJqOvJs6Mfo2ph00Cm1Wzp4k4D2nRxNHUeegvil0+MSLpMz6m7gwhRH7+/prPwgmjpRJiJNTr198od6GXZJ4WjBtF88eOpBti2rF82iRq0L6zjAN+5BNlAH+ewkVl4zJ/3EiaP0bwX71CywR/w/910dKw2+F2xcTw8+7tWzLfb4iW9c+lC+nonr/o3InjlDXPC5blwTANQzzw3Lx2lfDBY86G4SIox4sF6MzRw8a4MUMstIYYhsaXMDQ08+cVFbF91XK6c+smXTgVnSbk6YdxSj6U7/7dO/L18xHjKHfBItKdInUa+t/3w+j8yX/o+qWL9EDcJGOmnWtWJhgbJWP60B/o1YpVCOkkhNRI1M/P36ncVnIwvG4lGhsMH1GPUwb3p+QiTXycoBZCKa3yYMYVQ9GLZ07JIWiI6J2ui1EJhpuKHL4Op/zkLVJMDt9vi97p/KkTilV7+grFNtedFqhzXL98Ub5lzp5LKhleApMkofpiioFvEY2JOM5Di6HxZ8tJyAMoICiI6rcD/y45KhDn8mj87nC4V7rI8dp5s2S+s73wIjXr0ksDAL1mbJTx+axapale8sD2LZI9U9bslC7Tc7FFtcX/bshtoWx3pay0mTLFKfPgjq0yPF/RlzWlVBFQeZiXjdu0mzr88JPy1p4Y4oOATdPOPeOFDUYEIDQa04Z8L93u/lfqrXdlI4B0Ni1eQMun/yaTLFbmTSpTraYheavGSzEEBD066D8oaVLlHevznpgKYDoASpsxc6x8jwtQynviwD6CnQBD6WsXz4t7s6LrBz11/XadNDG5ChSW7pOH/nbmFz205BdK7U5ya4955fw5OS9EATA8S5MhI730Whna9+dG2rhoHjXu1N3SCAT+gq++JoeUGM4i7oHt0cPagiVfo1uiF42NMORqUSoaWDPPR336O31ID8ScctrQ6A88MjyC7t+7I/K3SQ6fEL9SvcZmMdo7hjtXzp+V75mEYcmK0ONYEYa3mDODUL60GTOJedobct4WFzbZ8uaj9KKnwTAPc74KtevTi8Iwk1C6FRwXTv0ETrUMIlv1/pYO7txK90JCZI8RKIw5rb/sZ+DRv2DOixEOeqMHYkSB+ffWFYslCxpXcy8b9iDUqR4wh30YFibjVKrXSC9eutE4xVbX6OXfrFlX8qFnhM0A/Ogh8QfKkjM3vfZ2NXq7SQtKKYbkiuq160h/rVsVb34Vz86nWxVzfUyPgFYUBgLQmzXqSsW8e/u2NALFNtcs9GppTTERT/WYhV4tJYwt0RUMfyvSG2D04VAkM8EwgXmkmVKlTU+NOnbVegpzON4xzFYyVU9mxWflpwwpEpuYXqd8zXpSMR+HTXMx8tgtLNAYWo7r9yV9P2uRVRKP9YsNp/CHzjilSpuO0j/3PP0bckTKzS56ebzHRihD5xqVnYJR3mYWVmMYtazqIaVIt2H7LlS6SlUnWfCIrQyYlypKnzkLfTdzoZznQ+FQ5yA0HL+P/pk2i+lV79GTKWPWbNIf/AMEprALwHLvxL/kD2nHUPwyks3/3KaYWP9ZL4woIAzVbl6/Kv/SZX5OWMX8ZY+0es70WI1ABYUCgjAxBziwlILQk1oqpmiZQVCQ7iPGS7f5X6Zs2c1e0pCBJYbgK5ekdRWKhpa0z8QZlDpd3EfupkqXXg4/YQ1ETx1fgjXQgM21K0LJr1DaTJk1bOIykOFjbfpZdxrzTS/CUtSyaRPjm7TGB+NPj5ETtHe9wwqnxb+Nk/N+xQcLJwxk5p5MGX8Un3qih81dsLBcgipetrzy1p4wOFVt/qGYu16WdgjUw3M5csmpAEZaVgTjT69fJlkFaUqmAjE96jhwuJzr79+6STb0+K7wfV0+e4aGdv2UBgjlVYT5L6YfsA1gOnVg2xbasXZFNL9Ypx7Spd0TN4gqjbieblPMfX9u0JQJhpxejYxzEWTq2N5ddPafY4ThmZnQGmcQYF4Vw2FY8UCZs+eUQz4zr/4dxp8XihbXe8Xpxvpa447dJA96c6zNoSXt3agW9Z02L870YPnL+Hw2WbEXLIwTEPrHhF/lkKhkxbe1fO3bsvGx2DzOQFZBWGTXL5grTfpzRv0krJDxq8qY9otg/IkvTsBjzqihEqM0YsiNIT+GwlN//I6KlilH6GHMhAZylFivBgEnvQXWzIt3WHpVPZSvVZ/6t2kujUW9GtekflPnERp0M8H487gyoEPYt3kj3RANH+ogS67chLVI/DUT8/of2n9IsBOcOnRA1hMaBFih9fwwsuGvaeceNLDDR3IKcvrwQbnEoh8Cm/PnyrvbjD/r5kUbNpA5P/8Apz+V6biMQIVE7wiCdRZUqGRp+bT8p8yNloHx8yxc6nWq/dGnkhmWuRE9P3NaLzRLwrwQdPrIITr013ZDMNYu0dNgiDbqy66aLDuwwZAQczx88BjOYegYH0ooTOgBR3/VQ5vrfdi7r1gS+lomBWv0mK97GpJFvkB4wpKJv8cppUGAeMFyU922HaQ3erSfe3bSsDPzPu49/OFD+uXLbjTzp0G0cpZxGQ15g4VfUbgY/ur5V8yYrILkU/Lne8SvpjEGJpte4tfMJjAxDOvU7pKyYr3y0/7RPZ5eTNc679A50VtuWjyfmsAIJEAyU0Exz1RzMYQVLBGHYsZExlwFQ5XYqMArJck/IDC2YKrTpr3MO1rEQzu30drfZzkN1/SRsfYFowYUA7uPmnzWQ+5SuSGGxtOHDSQsDYDeadxCfqxoweOLTVxGIMjEslK15q1o0aSxeI0XqR4zPDx+OOHjVMYSzPNKVKgs03mlfCVpUIGBBpZ3taYa21A2XpnTMdVq/Qn9tX41nRQbPI7s2inXM6s0bKbjIDm/j6uu879cUvbmOfMXlA0nypJaDItLCyuzw+Erv5NVs6ZKmRiNqalLTrHchvqHIqfJKPhFuR1iWQ1pKeXOJHYKxTbENmTyCV/copgbhcVQtSaxGXewwDx5UD/5QWM3RbkadZyKAAOQnqCokuJo9qEg37VtoY9mcI9avVUOT1XLbggULxgKf9pvMPVoWEPOg6cNFYvqFSpplWbmx1Dmk76DaWTvLtJiOU5sNjATlhveivmoNi58AmxE4xZbfut+3FHuXrl28YI5Wct3Bd1jcRLD0HAxrIMBBITF+Q96fqXJRM95aOd2uYY7ZVB/wvZIDDdjy6cW0eSIjR+9bLv+oh7qV5cbPWaIHg/DSb0yoMeOq65/Xr5JLru1E/XZu2ltacRBz4k/PWENs0X3PpoX6r9Xk1rR/MMH00zxpyfwf9DjEb8+zC63W4ayezevl5sCsr+QXww/X7fMaxmx1Qvrkdg8gJYRlDx1avmeLGX0Wh0qGrsuwIN1QlUpyVOlkn56k7vyA29cf1jIBsH4Ab5U4s9MMFZhVwfCsWcTO0FAKdKkkX4wvugJvcjAuUtlywoDDggfHIwXLXt+LTcaqAXphGKzKwYbKAbyg502esJ6IHYbqTInFQaRuAhzP8Ub1xOKgXkl9viCr8XnfQyNE8rZtEtPGYbFemy0AMWFq1W+VLnSpHc28GTNnVdaxpF+oBhRYaeOTCO+ZRAKBMLI4ofZS2T9ID1FMEIWFlORr8Ras94ghfr/YU7s/NhtVLxsBSXGLU+fmftPRrlFshcLRW8UmCRIzqu9GAaPLTrqB1MeNFJq32xcmU0of1yy4hvmlqFsfBP/r/LpW+X/ahmf5XIltH4Sym8HNm4ZytqRMZbBCHgzAqyY3lz7XHaPRYAV02OrhjPmzQiwYnpz7XPZPRYBVkyPrRrOmDcjwIrpzbXPZfdYBFgxPbZqOGPejAArpjfXPpfdYxFgxfTYquGMeTMCrJjeXPtcdo9FgBXTY6uGM+bNCLBienPtc9k9FgFWTI+tGs6YNyPAiunNtc9l91gEWDE9tmo4Y96MACumN9c+l91jEWDF9Niq4Yx5MwKsmN5c+1x2j0WAFdNjq4Yz5s0IsGJ6c+1z2T0WAVZMj60azpg3I8CK6c21z2X3WARYMT22ajhj3owAnyvrzbXvoWX3EZf7+IkLcj2exGn74cmTU5Q40d1uYsW0G1GW98QIpN2xhZ5bsoCSivsqHRHOl+c+sWA3RowUlw3dF/euXqhWm4JjuQ7kSZLnKxKeBDWOYzsCOaaMo8yrl9kuNzEFXqr8Lp1p3tqWJLnHtAVGFuIKAqn37DQoJXohDBGfBfK7c0fr3dGw3BKXYN0s/qrLWWfFdBlCFuAqApnWLNdEXBPX+Z1s+TFFxXGHqcbsAQ6fsFDKPfFXSi9uCQehLHYoJltlPaByvT0LyU6d0CA40/iDZ0YpkWk0IMizomSnTyqnS09WTJfg48h2IOB/55EFNlzcW/qskT7P/iG3bck+K6YtMLIQRsBeBFgx7cWTpTECtiDAimkLjCyEEbAXAVZMe/FkaYyALQjwcoktMLKQxETgnjAWfdmsLgUEBdGAmQsNSW9dsYTW/D6Trl+6QOkyPUeV6jWm196upvFcOX+O5v4yjE4dPkgpUqehinUaUplqNbVwvWPXhjU0oV8feun1stT2m+/1QW53s2K6HWJOwE4Ewh48oJ+7d6LzJ/+hVOnSG0SvFQo55pte0i9FmrR08fQpOrB9C90XilyxbiO6fSOYejeuSSE3b1DKtOno7PGjdGjnNrp7+xa93fh9gyzwjPm6J926fk3Eu24IS4wXHsomBsqchi0IbF+1jD6rUZn2bFpnKW/J5PHSv8PA4TR2w1/UvGtv+b58xmT53Lp8sVTKMtVq0eh1O+iTvoOk/+q5M+RT/298vy+lUur9EtPNPWZios1puYTA76N/ptvB1+i9Dz6iRZPGGmRFRUVRnbb/oxtXL1PJSlVkWO5CReQTvSwIveKrFauQX0AA+YhfhkRGRkh/DHn19OfShbRt5VLKni8//XvsiD4o0dysmIkGNSfkKgIV6zakV96sTA9DQ50UE4r2RtUahiTWL5gr3wu8UlLzT5sps3T/2Olj0fOupzQZMlLjjt208OArl2nCd33o+dx5qU6b9jSsa3stLDEdPJRNTLQ5LZcQeKdxC8qQ5fl4yVgwbhRt+GMuBSZJSvXbdTLEQQ+6T+xtDX8YRkHJkole9ooWPubrHnRPbExv128Q+Yue9WkRK+bTQp7TdRsCc3/5iWYOHywVq/OQUaR6SZWgf2Ag/bb9IH07Za40EA3u2JauCSvumrkzae/mDVSlQTPKlC0HPbh3T0aJCA+nO7duquiJ8uShbKLAzIkkFgLzRo8QyyE/yZ7y85/HUqGSr2lJYx6K3jGJ6CWTJEtO+Yq+rM0jj+/bQ1geAa2YOVn+qYhQ1tZlX6apu46Qn3/i9KKsmAp9fj4zCERRlGVed65dSbNHDiGHry9BKTG3jIyINvDAD8sf6+bPpuotWlOzLr3EMsltsexyQspKnzkL5XgxP4U9uK/Jvh0cTP8ePyLXO3O8WEAYjBJvgMmKqVUDO54VBHzIxzKrv/86XPpDGfu2bqrxJEuZksZv3is3E2xY+Dst/m0cnTz4N8HQEyHOF4IC5ylSlF4oWlyLAwd60EH/+4jyFXuZug03WoENjG54YcV0A6gs0r0IOPx8KXX6DIYNBtcunpfrjvA3U7KYn5JB8boM+5WmD/meDv21nYKSJqM3a9aV650Oh3NvCOMP5CVPldos0u3vfOaP2yHmBB6HQKkWdTWW7b/9rrnd6QgTSy5QPCyz2EF2l4F7TDtqhWU8cwgECMusJ5Nz/+3JueW8MQJeggArppdUNBfz2UKAFfPZqq//ZG5D0z0y2ASKhf5njfR51pfFlXLwHNMV9DiuLQjcyZ2HAq9flbLyjBlOZ5q2orC0xp902ZKQG4QEiE31OaZN0CSjLHYQK6YdKLIMlxC4UKM+pdm9UxycHEEpThynwt/2dEne04ocKTYxoCx2EA9l7UCRZbiEwL3sOen0+20o0t/+y3lcylgCIiPvKAPKYgfxOqYdKLIMWxAIunCOMq9cTMlOnaSAm8HiNGXrrXe2JGaHELEGGpY6Ld3NlZsuValOD7JktUOqlMGKaRuULIgRsA8BHsrahyVLYgRsQ4AV0zYoWRAjYB8CrJj2YcmSGAHbEGDFtA1KFsQI2IcAK6Z9WLIkRsA2BGzbYBAZGUkLxo6iuxbXkOFg3ioNm8rfv6mc//P3Xtq6Yql61Z4OXwcVe+NNpyMh/pjwK4XcuKHxKUeKNGmE7GaUNHkK5SVP2f5z6R9O1naHw4cKly5DRcXJ2k9KOCR446J54ujDR6b8Gi3bGH4bqJe9bNokunbReZtZitSpqXL9Jobf+l0QywTr5s8yyIYs/DLpxeIl5NGLetn46dLKWVOo3Ht1KKU44Dg+NHvEEAqNOc5R8ePnT1WbtZSHICu/lbOmUvDlS07+KtyV55Zli+iE+KGyFeURR06+/u57hiDwnzz0t1N95sxfgMpWr23gxY+f14hzYtV5PSowICiQyteqT5myZlde8rl99XI6vm+3k+xsefPJ32rqfxaGw59XzZkuDpC+Y5CBX6ogH1nEsoldZJti3hEnV88fN1IeLWiVuRtXLlGL7n20oJ1rV9GSyeO0d71j6ZQJ9POyjdohSvfv3qH5Y0ZS6P3ow5H0vHBfPvsvtf16gOa9Z+M6+St1zUPnWCwOBR66aA1lFoctPQnt27rJ6ehEHKtoPhUcsvFL+vljR4qzUK9bJnX6yCHqNHiEFnZw51Yn2SoQv7rvP30+5RFXiSs6feQgTR38HaUWDR8OMQahgcTBUbEp6oqZU+TJ40oGnvj4ipR+w9AYThzwtWQpVLK0CCsj3Xb9G9v3C3k6upW8JKKB1Svmvj830vDuHa1YpR9OwStZ6W0tfHj3DnRk107tXe/YsWo5/fjHKs3r8K4dNLRzO+3d7PDz99NwRdioL7oS8mNFmxbPpxErNlsFPZGfbYqJI+cnbtknjgR86JQRnJ598cwpgz/O8qz9kTMom8Vhu+O+7U1XxWKzOt0MveH4zXvkcYMGIeKle/3qdMkku07b9lS1eSsR+qhXQzycCTOyVxe6cu7fJ1bM6u+3psr1mkjZOOF75k/Rp3lDvplwzswvq7fSQ3EduJn6tWlO58Qx/3p6q0FT2ftFRUXqvemw+NB++LSVwPC0QTGjhBKCIiMe8S+aNIZmjxgq6wJ3e1hRiQqVqf2AoVqQw9ePzL9PhOwKtRvYrpRIFA1W6SpV6eNvf9DyAMevfbrLs171nhdibmhGo4SzXhVdFXeQdKv7Lqlw5Y9RR/GyFajjoOhjRpT/hO++ok2L5qtX+bwYI7vPhBmUu2BhLeyWaEg7Vi1PkKWnC+Lmaxzu1W34GL03Tf1xAK0WPSlGMGYcDYwJeLFNMZEmThCzOkVMPxzQ5w1HO5gpQFydbUV+YssT/sxkdSQEeIKSJjWzCtCsP1Qnxsd4KNmx5VUf3dfPj/BnJofDl5Ri6cMCkyTRv0q3lZ8TU4zHPXHAFM6xCQt9IC/dseKDIlphr+eVdWbTr/v1cpUbmJjzYIWT4g8ISmLgD7T4dhSvrzh6xFm287ej+ANFA6bnD70ffSCX1aFfqDc9L2RYfZdK9pM+nb+YJ5UURzx1UlkcLFqQOrZe83iMA0O3+FJCeOMrMzH4EoKfXfnBUY/uJFwKZL7mAH5M0QjYrpioUFyBpowjV8+fpZvXrhLmDlZ0TxiL7ohWXpKIizM8QXpjjvQQ/8yycU/FFSE/a568isXwxHVtd27divYTsnfHnBtqJdsQ0eYXQz5iZGN4i6GuFT24d1fcMHVDC9q1frV0J01hjaHGGE8HjmjEdXQgGNvSpM9o2avHU1yC2XAtAebX+DMT5ozxIjc3HPHKgxuZbFfMOSOH0rwxjwwaKu+wHJoJH2fbiqWcDEY5CxSirMIqZiZYZq3mdFay0Tt+WqWMk5EB85TchV4yi3bb++RB/WiFmIviNG8zla0ebbAx+2PuhDmUnvAxw0BjB6Hx6/BuOU0Urh3oN22+pQFLY7LR8f3sRYZrCZToKYP600FxLR6TGB7bDUIZ8bEFYJ4U06LBiIOj5/eLuyKKly1vSM5fzCdbf9FP3tCEACgTrFu4YQknZqfNmMnAjwtIMfdRc7MbV67IE7NxD0Wpt9418GLu+WHvb7SlCvS2fwqz+3nxez/kyWw2N0SO54t+uIf8wgjQpNPnlC5z9O1RaHhWzZ4mT/wu+sYjRYD45OLS1DJVa1qmhOvjYGhQBAv2iQP7xOHDRymPRaOChlBdJYdjHEFLpoynhu27KBHaExfl6I1R18WSyCqxNLJvyyZheDIuPexev4b6vG/8fSHwL/p6OXGz1pNftoM52nM5cml5Ug7cI+Iq6evEVVlPM77tipklZ26q9eEnWpkAFG75hUXRinCup56SpUhJMNVLq6xJMaFMNVt9rGen7auXCavsaYOfelFLCOodvQ4sf7DK2qGYeqMWhmVYO4W1USkmjAi4mQpH8ddq7WyBVvkyP/Xmf4RhTW1QhzaynHrFhEFEWSpx+SpIXTlnXmuTgeJftfc/VE75hMJDMcNFI2Kmhw9DnZZWrl+6KJanzrikmOZ07HzX14mdchNblu2KaS4AgIq2YsXPmIA7JSTFcw4B/vi2kkp2fPnNZXla72p+bs53LjHk/3HBSkO2ZgwbSBjy1/uko8E/oS+ot1JvVTWsD0PG4I5t6Ji458MdlCClEvn7L5NXbckzf9j/5Yo1lw2bNP7ettlyrmvmxfvTwOpppGlVdk/ws63HxLxl9Fc9CVZWM4XcCHZa+/lr3WpaO2+WNhdVca5fviid+rUiGE7GfNPTcktesNhRlDl7ThVdPrE7Aztc1DxXBd64dkU69bJVWHyfB3dspaVTJ4h5bhRdFkNi0Hixk8W8zU0vb5u4ovzsP8f0XtJdrMybVKVRc83/6N5dtFD0dpCtpxCxqwqEW6qelLYsW0xjv+1FacT0IFf+QpoYtYUySI1UYkLQe+0XOA5s31rjhePEgf2Gd7tesNkCW+PMpNaMJ/TvI2/oUuGhMZf/qHDlj/fj+/Y65fvM0cNO36D6DiYLoxOmUIoehoVJZ5KkMaO3mACsnWK3lRmTs/8cjV7Dt1ivVjIT+rRNMcMehIo9qgec5iTIEOZB5rkhljlOyf2Pxo/QVyx+vyX2vuJ2JUUA6uShA0IxxXETJsqUNYe8+VfvfVUYQJAXZSRSYViewG6WvEWKKa8EPzHHQl6UbNxtoXaf4E5Fw9KN+LgRjq2E2OtppgzPZzV43RD7PE8dPqjdUKUCfYQhC3NXswFJheufucQOlrwvFXNabipfq55YEvGVO1QkNjFTBWCCOW2J8pX1YmR6R8QBWeZ8Y3mlhLgu3W4KETdrgcxlRLl3rlkZXZ+66Q0aDvCa7QhNOnWXd2Oa8x0o5uPNu/U2ZLtEhbfk/uN/xDxb1ScYILtwqdflXll9hMYdutLUIQOcMMEOq+Zde8W6/KWXEV83Hy0SX6SYjxFIRAS8ao6ZiLhyUoyASwiwYroEH0dmBNyDACume3BlqYyASwiwYroEH0dmBNyDACume3BlqYyASwiwYroEH0dmBNyDACume3BlqYyASwiwYroEH0dmBNyDACume3BlqYyASwiwYroEH0dmBNyDACume3BlqYyASwiwYroEH0dmBNyDACume3BlqYyASwiwYroEH0dmBNyDACume3BlqYyASwiwYroEH0dmBNyDgCNcHKfPxAgwAp6DAHTSgeMVmRgBRsBzEIBOOsRBT6yZnlMnnBNGgKCTjuDLl6OP7mZAGAFGwCMQgE46Qm4FL8GlP0yMACPw9BGALkInHVHhkdPPHD0k71N8+tniHDAC3osA7jSFLkInHUO6tNsWFha66Lg49l7de+G90HDJGYGngwB0T+qg0EXopFzHjIj0aSvucDx/6K/thJPQ+aj6p1M5nKr3IQBdg85B96CD0EWgoN3M8tmQ0UUcjqgl4hTqbDg6Hlfg4ao43CmPq8GZGAFGwB4EIiPCxdQxlO6Iqy+Cxen7uKhYKOjZyEifakM7t5VH9muKiSQ7DhuWyY+Chooz4huJAEOYPVliKYwAI6BHQFwQEiW0cmY4Pfjsp06dLqswS+X7bMiIQr4+vvWjHA7ctvq8iGrPHeMqVX4yAt6MgA+FiOKf94mM3BgRFTFnaOf2B81w/B+8reCSVGvsqAAAAABJRU5ErkJggg==);
}

.visa-mc-cvc-preview {
	background-image:
		url(data:image/png;base64,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);
}

.error {
	color: rgb(235, 57, 57);
	font-size: 10px;
}

table, td {
	border: #8B8B8B 1px solid;
}
</style>

</head>
<body>
	<div class="container-fluid py-3">
		<div class="row">
			<div class="col-12 col-sm-8 col-md-6 col-lg-4 mx-auto">
				<div id="pay-invoice" class="card">
					<div class="card-body">
						<div class="card-title">
							<h3 class="text-center" id="fillIn">TrainMe Money</h3>
						</div>
						<hr>
						<form:form method="POST" modelAttribute="cardBean"
							enctype='multipart/form-data'
							action="/TrainMe/studentMoney/checkout">

							<div class="form-group">
								<label for="cc-number" class="control-label mb-1 name">持卡人姓名</label>
								<form:input path="cardName" name="cc-number" type="tel"
									class="form-control cc-number identified visa"
									required="required" autocomplete="off" />
								<span class="invalid-feedback">Enter a valid 12 to 16
									digit card number</span>
							</div>
							<div>
								<form:errors path="cardName" cssClass="error" />
							</div>
							<div class="form-group  align-items-end">
								<label for="cc-number" class="control-label mb-1">信用卡卡號</label>

								<div class="row align-items-center" style="margin-left: 2px;">
									<form:input path='cardNo1' required="true" maxlength="4"
										size="4" type="text" class="form-control col-md-2" />
									-
									<form:input path='cardNo2' required="required" maxlength="4"
										size="4" type="text" class="form-control col-md-2" />
									-
									<form:input path='cardNo3' required="required" maxlength="4"
										size="4" type="text" class="form-control col-md-2" />
									-
									<form:input path='cardNo4' required="required" maxlength="4"
										size="4" type="text" class="form-control col-md-2" />
								</div>

							</div>
							<div>
								<form:errors path="cardNo1" cssClass="error" />
							</div>
							<div class="row">
								<div class="col-6">
									<div class="form-group">
										<label for="cc-exp" class="control-label mb-1">有效期限</label>
										<form:input path="expiryMonth" name="cc-exp" type="tel" maxlength="4"
											class="form-control cc-exp" required="required"
											placeholder="MMYY" autocomplete="cc-exp" />
									</div>
									<div>
										<form:errors path="expiryMonth" cssClass="error" />
									</div>
								</div>
								<div class="col-6">
									<label for="x_card_code" class="control-label mb-1">CVV</label>
									<div class="input-group">
										<form:input path="cardCVV" name="x_card_code" type="tel" maxlength="3"
											class="form-control cc-cvc" required="required"
											autocomplete="off" />
									</div>
								</div>
								<div>
									<form:errors path="cardCVV" cssClass="error" />
								</div>
							</div>
							<div class="form-group">
								<label for="x_zip" class="control-label mb-1">手機號碼</label>
								<form:input path="tel" name="x_zip" type="text"
									class="form-control" value="" data-val="true"
									data-val-required="Please enter the ZIP/Postal code"
									autocomplete="postal-code" />
							</div>
							<div>
								<form:errors path="tel" cssClass="error" />
							</div>

							<div class="form-group">
								<label for="x_promotion" class="control-label mb-1">電子信箱</label>
								<form:input path="email" name="x_prom" type="text"
									class="form-control" value="" data-val="true"
									data-val-required="Please enter the Promotion  code" />
							</div>
							<div>
								<form:errors path="email" cssClass="error" />
							</div>
							<div class="form-group">
								<label for="x_promotion" class="control-label mb-1">帳單地址</label>
								<form:input path="address" name="x_prom" type="text"
									class="form-control" value="" data-val="true"
									data-val-required="Please enter the Promotion  code" />
							</div>

							<form:input style="display: none;" path="money" />

							<div>
								<button id="payment-button" type="submit"
									class="btn btn-lg btn-info btn-block">
									<i class="fa fa-lock fa-lg"></i>&nbsp; <span
										id="payment-button-amount">付款</span>
								</button>
							</div>
						</form:form>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
		integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
		integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
		crossorigin="anonymous"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
		integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
		crossorigin="anonymous"></script>

	<script>
		value = localStorage.getItem('name');
// 		alert(value);
		 money = document.getElementById('money');
         money.value = value;
		
// 		
		
		var fillIn = document.getElementById('fillIn');
		fillIn.addEventListener("click",function(){
			document.getElementById('cardName').value = "李淑芬";
			document.getElementById('cardNo1').value = "3422";
			document.getElementById('cardNo2').value = "5422";
			document.getElementById('cardNo3').value = "9845";
			document.getElementById('cardNo4').value = "8533";
			document.getElementById('expiryMonth').value = "0225";
			document.getElementById('cardCVV').value = "112";
			document.getElementById('tel').value = "0986465432";
			document.getElementById('email').value = "ali8210225786@gmail.com";
			document.getElementById('address').value = "台北市萬華區洛陽街69號";
		})
		
	
	</script>

</body>
</html>