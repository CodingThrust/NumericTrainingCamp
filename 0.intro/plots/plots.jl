using LuxorGraphPlot, Luxor

function diagram_numeric_methods()
    nodestore() do ns
        ed = box!(ns, (-150.0, 0.0), 120, 50; smooth=10)
        tn = box!(ns, (0.0, 0.0), 120, 50; smooth=10)
        mc = box!(ns, (150.0, 0.0), 120, 50; smooth=10)
        md = box!(ns, (300.0, 0.0), 120, 50; smooth=10)
        with_nodes(ns) do
            stroke(ed)
            text("Exact Diagonalization", ed)
            stroke(tn)
            text("Tensor Network", tn)
            stroke(mc)
            text("Monte Carlo", mc)
            stroke(md)
            text("Molecular Dynamics", md)
        end
    end
end

diagram_numeric_methods()