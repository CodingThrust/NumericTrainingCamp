using LuxorGraphPlot, Luxor
using LaTeXStrings, MathTeXEngine

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
            text("Quantum Wave Function", offset(qm, (0, 150)))
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

using OMEinsum, GenericTensorNetworks

function plot_net(code, tensors::Vector{<:Pair}, label_locs, fname)
    config = GraphDisplayConfig(; edge_line_width=2.0, vertex_stroke_color="transparent", fontsize=14, fontface="Georgia")
    filename = joinpath(@__DIR__, fname)
    show_einsum(code;
        tensor_locs=second.(tensors),
        tensor_texts=first.(tensors),
        label_locs,
        config,
        filename)
end

function plot_matmul()
    plot_net(ein"ij,jk->ik",
        ["A" => (0, 0), "B" => (100, 0)],
        [(-50, 0), (50, 0), (150, 0)],
        "matmul.svg")
end
plot_matmul()

function plot_svd()
    plot_net(ein"ij,j,jk->ik",
        ["U" => (0, 0), "S" => (50, -50), "V" => (100, 0)],
        [(-50, 0), (50, 0), (150, 0)],
        "svd.svg")
end
plot_svd()

function plot_traceperm()
    plot_net(ein"ij,jk,ki->",
        ["A" => (0, 0), "B" => (50, -50), "C" => (100, 0)],
        [(50, 0), (25, -25), (75, -25)],
        "traceperm.svg")
end
plot_traceperm()

function plot_mps()
    DX = 100
    plot_net(ein"ia,ajb,bkc,cld,dm->ijklm",
        ["A" => (0, 0), "B" => (DX, 0), "C" => (2DX, 0), "D" => (3DX, 0), "E" => (4DX, 0)],
        [(0, -50), (0.5DX, 0), (DX, -50), (1.5DX, 0), (2DX, -50), (2.5DX, 0), (3DX, -50), (3.5DX, 0), (4DX, -50)],
        "mps.svg")
end

plot_mps()

function plot_inner()
    DX = 100
    plot_net(ein"ia,ajb,bkc,cld,dm,iα,αjβ,βkγ,γlδ,δm->",
        ["A" => (0, 0), "B" => (DX, 0), "C" => (2DX, 0), "D" => (3DX, 0), "E" => (4DX, 0),
        "A*" => (0, -100), "B*" => (DX, -100), "C*" => (2DX, -100), "D*" => (3DX, -100), "E*" => (4DX, -100)],
        [
            (0, -50), (0.5DX, 0), (DX, -50), (1.5DX, 0), (2DX, -50), (2.5DX, 0), (3DX, -50), (3.5DX, 0), (4DX, -50),
            (0.5DX, -100), (1.5DX, -100), (2.5DX, -100), (3.5DX, -100),
        ],
        "inner.svg")
end

plot_inner()

function plot_tebd()
    DX = 100
    DY = 70
    nodestore() do ns
        circles = [circle!(ns, (i*DX, 0), 20) for i=0:4]
        boxes1 = [box!(ns, (i*DX, -DY), 140, 40) for i=0.5:2:3.5]
        boxes2 = [box!(ns, (i*DX, -2DY), 140, 40) for i=1.5:2:4]
        dots = [dot!(ns, (i*DX, -3DY)) for i=0:4]
        with_nodes(ns; filename=joinpath(@__DIR__, "tebd.svg")) do
            fill.(circles)
            fill.(boxes1)
            fill.(boxes2)
            for i=1:4
                line(circles[i], bottomalign(boxes1[(i-1)÷2+1], circles[i]))
            end
            line(topalign(boxes1[1], circles[2]), bottomalign(boxes2[1], circles[2]))
            line(topalign(boxes1[2], circles[3]), bottomalign(boxes2[1], circles[3]))
            line(topalign(boxes1[2], circles[4]), bottomalign(boxes2[2], circles[4]))
            line(circles[5], bottomalign(boxes2[2], circles[5]))
            for i=1:4 line(circles[i], circles[i+1]) end
            line(topalign(boxes1[1], dots[1]), dots[1])
            line(topalign(boxes2[1], dots[2]), dots[2])
            line(topalign(boxes2[1], dots[3]), dots[3])
            line(topalign(boxes2[2], dots[4]), dots[4])
            line(topalign(boxes2[2], dots[5]), dots[5])
            sethue("white")
            fontsize(16)
            text(L"e^{-ih_{12}d t}", boxes1[1])
            text(L"e^{-ih_{34}d t}", boxes1[2])
            text(L"e^{-ih_{23}d t}", boxes2[1])
            text(L"e^{-ih_{45}d t}", boxes2[2])
            text.([LaTeXString("\$A_$i\$") for i=1:5], circles)
        end
    end
end

plot_tebd()