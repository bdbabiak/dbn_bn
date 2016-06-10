 z←bn_calclatesthhat layernum
 j←1

 hhat0←g_mnistmat[1;;]
 :While j≤layernum-1
     ⍝ need to flip w here, between alternate layers
     hhat0←(g_isz,g_isz)⍴,⊃(bn_x hhat0)
     r←(hhat0+.×g_w[1;;])
     l←(g_nin,g_nin)⍴g_b[j;;]
     ⍝axt←(g_isz,g_isz)⍴↑l+¨(1,g_isz)⍴↓r
     axt←l+r
     ⍝ ReLU - hhat←⍟(1+*axt)
     hhat←(1÷(1+*-1×axt))
     g_hhatarr[j;;]←hhat ⍝ store each layer's posterior
     hhat0←hhat ⍝ output becomes input to next layer
     j←j+1
 :EndWhile

 z←1
