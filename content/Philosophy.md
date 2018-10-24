---
title: "Philosophy"
date: 2018-07-05T11:33:38-04:00
---

This document outlines Super.NET's primary philosophical drivers.

> Super.NET is intended to enable ubiquitous .NET client applications.

As an overall vision, the purpose of Super.NET is to enable ubiquitous .NET client applications.  It is meant to fulfill the ultimate developer use case:

*"As a developer, I want to develop my application once and have it run everywhere."*

## The Business Problem

In the current .NET space, this use case is not possible to fulfill.  As a result, developers must create **two** applications in their .NET solutions, which means **double the code**, and resultingly **double the risk**, and therefore **double the [total cost of ownership](https://en.wikipedia.org/wiki/Total_cost_of_ownership)**.

### Cost of Development

It is best to think of codebases as lump sums of money in terms of total cost of ownership.  Each incompatible language used within a solution has its own set of risks, idiosyncrasies, and challenges.  If the artifacts from one language cannot be shared and leveraged in another, *then it is considered incompatible and therefore expensive*.

Primary examples of ensuring low total cost of ownership:

- Cross-platform resources: e.g. in .NET you can write an artifact in F#, compile it, and use that resource in a solution that is primarily written in C#.  
- Cross-tier resources: e.g. in a WPF application, you can write a general purpose library meant for *server-side* scenarios (such as a logging utility) and easily share it in the *client-side application* without having to rewrite it specifically for that scenario.

In the scenario where a JavaScript solution is introduced into a .NET solution, *the JavaScript cannot be shared with .NET and vice versa*.  Therefore it is considered *incompatible* and an *expensive* approach as you now have to build and maintain two different codebases, each with their own set of expenses as outlined earlier. 

## Principles and Objectives

The following principles describe some high level objectives of this project.

### HTML5 as an Established Presentation Platform{#html5}

HTML has been a pillar of the web for several decades now.  That's a pretty amazing feat.  [HTML5 has been a standard since 2014](https://en.wikipedia.org/wiki/HTML5), and it has only matured since then.  Plenty of artists and designers have established great user experience and design around this presentation platform and *are now only getting better* which makes it a perfect candidate for anything required for presentation.

By focusing on *one* presentation platform, we cost and complexity is greatly reduced as now the system only has to account for this *one* platform.  Further, it is easier to gain expert status towards this platform as developers are spending all of their time within this one paradigm or way of expression.

Finally, from a personal point of view, having had my hands in HTML in some capacity since 1994 when I first started getting into computer science, it feels "right" using it and finding a way to cleanly integrate it with .NET.

#### .NET Semantics

The technical challenge here, of course, is that of .NET semantics.  One cannot describe a `DockPanel` in HTML.  They must use foreign -- and inconsistently cased -- constructs such as `<div />` and `<span />` to describe these objects.  This project aims to rectify this challenge by ensuring that when a .NET developer describes a native .NET element such as `DockPanel`, it will get converted as the appropriate HTML5 element(s) to ultimately render in the browser to which it is sent.

### Data Formats

A goal of this project is to also address a significant deficiency within our development community, that of data formats.  Ultimately, *data formats describe an object graph*.  This idea seems to be a lost, unknown, or at the very least very much misunderstood concept within our community.  The goal here is to enable users of Super.NET to use *any* supported data format, and to easily build additionally providers to enable other formats not natively supported.

To start, the following formats are recognized and *should* be supported from the initial version:

- XML
- JSON
- YAML

Additionally, we might consider creating our own format/dialect that perhaps improves upon YAML to produce our own unique format that is a part of Super.NET's overall design and is aligned with the spirit of .NET.  This indeed might be considered the next incarnation of [Xaml](https://docs.microsoft.com/en-us/dotnet/framework/wpf/advanced/xaml-overview-wpf).

### POICO Development

Poico -- or Plain Ol' Immutable CLR Object -- development means, by default, ensuring all elements used with the solution are immutable and cannot change state after they are created.  Additionally, the objective is to ensure these CLR objects are as "plain" as possible, meaning that they are defined with as little to no decoration.  Which *ideally* (there will be exceptions, of course) means no:

- Attributes or metadata
- Inheritance
- Use of virtual overrides

### Composition Over Inheritance

No inheritance means the preference of [composition over inheritance](https://en.wikipedia.org/wiki/Composition_over_inheritance).  Inheritance can be used, of course, for implementations of patterns such as decoration and delegation.  Classes should strive to be `sealed` and `internal` by default until needed otherwise.

### Progressive Web Applications

This will take some further investigation, but generally speaking Super.NET applications will be progressive web applications.  Investigation will be required for offline scenarios, mostly.  In this case, we might have to consider dropping into WebAssembly.

### Further Considerations

For further philosophical thoughts and musings around software, design, and life, feel free to [visit the series on the Super.NET Blog, Dawg](https://blog.superdotnet.run/2018/07/philosophy/).