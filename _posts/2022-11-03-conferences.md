---
title: Here's why Computer Science Conferences Suck
---


The conference system is fucking horrible for computer science -- almost all the bad things about CS academic research can be attributed to it

CS is weird because the primary places where you publish papers are conferences not journals -- all the top-tier CS venues, SIGGRAPH, SIGPLAN, SC, FOCS, and of course, all the big ML ones (NeurIPS, ICML, AAAI, ICCV, CVPR, ECCV) -- are all conferences, not journals.

In the rest of academia -- conferences are not top-tier venues for final paper publication, conferences venues for sharing preliminary results -- you chuck whatever data you have on a poster, go to the conference, and chat with other people about it before its published. crucially, conferences in those disciplines are usually not published, so are not citable (except as "personal communications" if you must)

The first problem with this is that journals do not have hard deadlines, while conferences do -- journals are normally published on a more-or-less rolling release schedule. you submit your paper whenever it feels done, the editor sends it off to reviewers, the reviewers take their sweet time reviewing it, eventually send it back, and whenever the whole process finishes, your paper will show up on the internet (and technically get printed in the next volume of the journal, but no one actually cares about that, journal volumes are usually printed like once every 2 months anyway, and you don't know how long the reviewers are gonna take, so there's no way to be like "ok i need to finish my paper by X date to get it in Y volume" even if you would care)

This is normally a good thing for science -- it means researchers can take as much time as they need to do the research without being penalized for it, it means reviewers can take as much time as they need. In effect, it basically means you don't have grad students pulling all nighters the night before a deadline to finish a paper -- which means the papers are probably higher quality

Part of the reason conferences have stuck around so long in CS is that its possible to get a paper done in a few all nighters -- once you have an idea for an algorithm, the whole "write the code, get the results, put the results in the paper" process can be basically as fast as necessary (unless you're doing super high performance stuff that takes days or weeks to compute) -- while if you're doing some field research or experiments, the experiments are gonna take as long as they're gonna take, there's no way to speed it up

But regardless -- CS still has conferences, so hard deadlines, which means grad students pulling all nighters to write crappy papers, faculty getting stressed and trying to "get as many papers in before the deadline" as they can -- because the goal is not to do research, the goal is to _get into the conference_, and those incentives are no longer aligned. 

The other massive harm of conferences is that the papers are reviewed with each other -- in a journal, your paper is being reviewed on its own, without comparison to other papers, so is basically only being evaluated for its scientific merit (is the methodology sound, is the writing clear, are the results reproducible, etc.). in a conference, your paper is directly competing with other papers (often quite literally -- pre-COVID, they'd literally get all the area chairs together in one room somewhere with printouts of all the papers and physically chose which ones to accept or not). This incentivized flashy figures and eye candy, bombastic claims about how amazing your method is, and making limitations seem as insignificant as possible

Because you are being directly compared to other papers -- if another paper has better eye candy that sticks in the reviewers brains more, they'll get in and you won't. If you're open and honest about the limitations of your method, then those reviewers will pick someone else over you who didn't say anything about limitations -- and keep in mind, there's deadlines, so the reviewers are on a time crunch (they also probably procrastinated reading the paper until the last minute after all)  -- so reviewers aren't gonna pick up on the limitations of your method that you didn't say, so you might manage to sneak in by basically just misrepresenting how good your contribution is

I CANNOT OVERSTATE THAT ENOUGH -- that's the biggest thing the conference system does -- it incentivized overstating the scale of your contribution and making limitations seem smaller than they are. I've experienced this in papers, when you can _smell_ that someone is hiding the limitations from you, that the examples they're showing are just slightly _odd_, but they're not telling us. Go read papers from physics journals, _even_ computational physics journals (where the material is very similar to CS, they're just presenting some algorithm), but they're so much more honest about it. The figures are actually demonstrating properties of the method (not just eye candy for reviewers), they actually discuss strengths and weaknesses of the method, and claims are not generally overly grandiose. CS papers just feel completely different.

Conferences turn CS from a legitimate science into a fucking shark tank episode.


