---
layout: post
title:  "Onsager's Variational Principle for Solving Inverse Problems"
date:   2025-09-30 23:59:00 +00:00
image: /images/cahn_hilliard.png
categories: research
author: "Ritoban Roy-Chowdhury"
authors: "<strong>Ritoban Roy-Chowdhury</strong>, Irina Tezaur, Nathan Urban, Anthony Gruber"
venue: "Sandia CSRI Summer Proceedings"
comment: ""
---

We consider Onsager's variational principle, which describes thermodynamic systems that are dissipation dominated. The principle describes the dynamics of a system as the minimizer of a functional balancing the decay of free energy and the dissipative force, and we develop an unconditionally energy stable time discretization based on it. Within this framework, we allow the free energy and dissipation potential functionals to be parametrized by learnable weights.  By optimizing these weights so that the resulting simulation matches training data, we can tackle inverse or system identification problems that can recover features of dynamics that may not be known in advance. We illustrate our method on several problems using synthetic data, with a particular interest towards phase field models used in modelling block copolymers. 
