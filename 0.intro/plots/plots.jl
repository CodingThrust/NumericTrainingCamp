using LuxorGraphPlot, Luxor

function solvable_quantum()
    nodestore() do ns
        qm = circle!(ns, (0.0, 0.0), 250)
        arealaw = ellipse!(ns, (60.0, -100.0), 180, 90)
        signfree = ellipse!(ns, (-60.0, -100.0), 180, 90)
        small = ellipse!(ns, (0.0, -160.0), 90, 180)
        integrable = ellipse!(ns, (0.0, -40.0), 90, 180)
        with_nodes(ns; filename=joinpath(@__DIR__, "fig1.svg")) do
            stroke(qm)
            fontsize(24)
            text("Solvable Quantum Systems", offset(qm, (0, 150)))
            fontsize(16)
            stroke(arealaw)
            text("Area Law", offset(arealaw, (20, 0)))
            stroke(small)
            text("Small", small)
            stroke(integrable)
            text("Integrable", integrable)
            stroke(signfree)
            text("Sign Problem Free", offset(signfree, (-70, 50)))
        end
    end
end

solvable_quantum()

function diagram_numeric_methods()
    nodestore() do ns
        ed = box!(ns, (0.0, -100.0), 120, 50; smooth=10)
        tn = box!(ns, (0.0, 0.0), 120, 50; smooth=10)
        mc = box!(ns, (150.0, 0.0), 120, 50; smooth=10)
        md = box!(ns, (0.0, 100.0), 120, 50; smooth=10)
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