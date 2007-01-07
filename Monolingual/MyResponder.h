/*
 * monolingual -
 *  front end for monolingual.pl (included in this package), which
 *  strips away extra language .lproj from OSX to save space
 *
 *   Copyright (C) 2001, 2002 Joshua Schrier (jschrier@mac.com),
 *   2004-2007 Ingmar Stein
 *
 *   This program is free software; you can redistribute it and/or modify
 *   it under the terms of the GNU General Public License as published by
 *   the Free Software Foundation; either version 2 of the License, or
 *   (at your option) any later version.
 *
 *   This program is distributed in the hope that it will be useful,
 *   but WITHOUT ANY WARRANTY; without even the implied warranty of
 *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *   GNU General Public License for more details.
 *
 *   You should have received a copy of the GNU General Public License
 *   along with this program; if not, write to the Free Software
 *   Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
 */

#import <Cocoa/Cocoa.h>

@class ProgressWindowController, PreferencesController;

@interface MyResponder : NSWindowController
{
	IBOutlet ProgressWindowController *progressWindowController;
	IBOutlet PreferencesController *preferencesController;
	IBOutlet NSTextField *currentArchitecture;
}
+ (void) initialize;
- (IBAction) documentationBundler:(id)sender;
- (IBAction) openWebsite:(id)sender;
- (IBAction) removeLanguages:(id)sender;
- (IBAction) removeLayouts:(id)sender;
- (IBAction) removeArchitectures:(id)sender;
- (IBAction) showPreferences:(id)sender;
- (IBAction) donate:(id)sender;
- (void) scanLayouts;
- (BOOL) applicationShouldTerminateAfterLastWindowClosed: (NSApplication *)theApplication;
- (void) cancelRemove;
- (void) warningSelector: (NSWindow *)sheet returnCode: (int)returnCode contextInfo: (void *)contextInfo;
- (void) englishWarningSelector: (NSWindow *)sheet returnCode: (int)returnCode contextInfo: (void *)contextInfo;
- (void) awakeFromNib;
- (void) runDeleteHelperWithArgs: (const char **)argv;

- (NSMutableArray *) languages;
- (void) setLanguages:(NSMutableArray *)inArray;
- (NSMutableArray *) layouts;
- (void) setLayouts:(NSMutableArray *)inArray;
- (NSMutableArray *) architectures;
- (void) setArchitectures:(NSMutableArray *)inArray;

@end
