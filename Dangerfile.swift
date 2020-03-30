//
//  Dangerfile.swift
//  iOS
//
//  Created by Michael Johnson on 3/30/20.
//  Copyright © 2020 Roadie Class Team. All rights reserved.
//

import Danger

let danger = Danger()

if danger.git.createdFiles.count + danger.git.modifiedFiles.count - danger.git.deletedFiles.count > 300 {
    warn("Big PR - try to break changes into smaller PRs")
}

let changedFiles = danger.git.createdFiles + danger.git.modifiedFiles + danger.git.deletedFiles

let swiftFilesWithCopyright = danger.git.createdFiles.filter {
    $0.fileType == .swift
        && danger.utils.readFile($0).contains("//  Copyright")
}

if !swiftFilesWithCopyright.isEmpty {
    let files = swiftFilesWithCopyright.joined(separated: ", ")
    fail("We do not include copyright statements in our files. Found them in: \(files)")
}

if changedFiles.contains("CHANGELOG.md") {
    fail("CHANGELOG.md has been modified; it should only be modified by semantic-release")
}

SwiftLint.lint(inline: true)

if danger.github != nil {
    if danger.github.pullRequest.title.contains("WIP") {
        warn("PR is classed as a work in progress")
    }
}
